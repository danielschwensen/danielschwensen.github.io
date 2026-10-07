# Validate the generated site, not the Liquid source in search.json.
require "json"
require "yaml"
require "date"
require "cgi"
require "uri"
require "pathname"

def check(condition, message)
  raise message unless condition
end

def words(value)
  value.is_a?(Array) ? value.map(&:to_s) : value.to_s.split
end

def normalized(text)
  CGI.unescapeHTML(text).gsub(/\s+/, " ").strip
end

begin
  site = Pathname.new(ARGV.fetch(0, "_site")).expand_path
  entries = JSON.parse(site.join("search.json").read)
  check(entries.is_a?(Array), "search.json must contain an array")

  # The current homepage lists every published post (there is no pagination).
  homepage = site.join("index.html").read
  links = homepage.scan(/<a\b([^>]*)>(.*?)<\/a>/m).each_with_object([]) do |(attributes, text), result|
    classes = attributes[/\bclass="([^"]*)"/, 1].to_s.split
    next unless classes.include?("post-link")
    result << [CGI.unescapeHTML(attributes[/\bhref="([^"]*)"/, 1].to_s), normalized(text)]
  end
  check(links.map(&:first).uniq.size == links.size, "Homepage has duplicate post URLs")
  expected = links.to_h

  # Read source metadata to catch missing categories or tags, independently
  # of the index template. Current posts all live directly under _posts.
  sources = Dir["_posts/*.{md,markdown}"].map do |file|
    front = File.read(file).match(/\A---\s*\n(.*?)\n---\s*(?:\n|\z)/m)
    next unless front
    metadata = YAML.safe_load(front[1], permitted_classes: [Date, Time]) || {}
    date = metadata["date"] || File.basename(file)[/\A\d{4}-\d{2}-\d{2}/]
    date = date.is_a?(Time) ? date.strftime("%Y-%m-%d") : Date.parse(date.to_s).iso8601
    [metadata, date]
  end.compact

  seen = []
  entries.each_with_index do |entry, index|
    context = "Entry #{index + 1}"
    check(entry.is_a?(Hash), "#{context}: expected an object")
    %w[title category tags url date content].each do |key|
      check(entry[key].is_a?(String), "#{context}: #{key} must be a string")
    end
    url = entry["url"]
    context = url
    check(!seen.include?(url), "Duplicate URL: #{url}")
    seen << url
    check(expected.key?(url), "#{context}: URL is not a published homepage post")
    check(normalized(entry["title"]) == expected[url], "#{context}: title differs from homepage")
    uri = URI.parse(url)
    check(uri.scheme.nil? && uri.host.nil? && uri.query.nil? && uri.fragment.nil? && url.start_with?("/"),
          "#{context}: expected a local article URL")
    path = site.join(CGI.unescape(uri.path).delete_prefix("/")).cleanpath
    check(path.to_s.start_with?(site.to_s + "/"), "#{context}: URL escapes the site directory")
    path = path.join("index.html") if url.end_with?("/")
    check(path.file?, "#{context}: article file does not exist")
    article = path.read
    published = article[/<time\b[^>]*datetime="([^"]+)"[^>]*itemprop="datePublished"/, 1]
    check(published && entry["date"] == published[0, 10], "#{context}: date differs from article")

    candidates = sources.select do |metadata, date|
      normalized(metadata["title"].to_s) == normalized(entry["title"]) && date == entry["date"]
    end
    check(candidates.size == 1, "#{context}: expected exactly one source post matching title and date")
    metadata = candidates.first.first
    categories = (words(metadata["categories"]) + words(metadata["category"])).uniq.join(" ")
    tags = words(metadata["tags"] || metadata["tag"]).uniq.join(" ")
    check(entry["category"] == categories, "#{context}: categories differ from source post")
    check(entry["tags"] == tags, "#{context}: tags differ from source post")
    check(!entry["content"].strip.empty?, "#{context}: content is empty")
    check(!entry["content"].match?(/\{[{%]/), "#{context}: unprocessed Liquid in content")
  end
  missing = expected.keys - seen
  check(missing.empty?, "Published posts missing from search index: #{missing.join(', ')}")
  puts "OK: #{entries.size} published posts; URLs, titles, dates, categories and tags match."
rescue StandardError => error
  warn "Search index check failed: #{error.message}"
  exit 1
end
