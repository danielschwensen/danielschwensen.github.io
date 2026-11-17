(function () {
  'use strict';

  document.querySelectorAll('.post-content pre > code').forEach(function (code) {
    var block = code.closest('.highlighter-rouge, figure.highlight') || code.parentElement;
    var toolbar = document.createElement('div');
    var button = document.createElement('button');
    var status = document.createElement('span');
    var copying = false;

    toolbar.className = 'code-copy-toolbar';
    button.type = 'button';
    button.textContent = 'Copy code';
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

    toolbar.append(button, status);
    block.before(toolbar);
  });
})();
