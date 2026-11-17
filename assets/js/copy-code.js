(function () {
  'use strict';

  document.querySelectorAll('.post-content pre > code').forEach(function (code) {
    var block = code.parentElement;
    var frame = document.createElement('div');
    var button = document.createElement('button');
    var status = document.createElement('span');
    var copying = false;

    frame.className = 'code-copy';
    button.type = 'button';
    button.className = 'code-copy-button';
    button.setAttribute('aria-label', 'Copy code');
    button.title = 'Copy code';
    status.className = 'code-copy-status';
    status.setAttribute('role', 'status');

    button.addEventListener('click', async function () {
      if (copying) return;

      copying = true;
      status.textContent = '';
      try {
        await navigator.clipboard.writeText(code.textContent);
        status.textContent = 'Code copied.';
      } catch (error) {
        status.textContent = 'Could not copy. Select the code to copy it manually.';
      } finally {
        copying = false;
      }
    });

    block.before(frame);
    frame.append(block, button, status);
  });
})();
