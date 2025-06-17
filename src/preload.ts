window.addEventListener('DOMContentLoaded', () => {
    const TEXTAREA_SELECTOR = '#prompt-textarea';
    const SENDBUTTON_SELECTOR = '[data-testid="send-button"]';

    const focusTextarea = () => {
        const targetElement = document.querySelector<HTMLTextAreaElement>(TEXTAREA_SELECTOR);
        if (targetElement) {
            targetElement.focus();
        }
    };

    const observer = new MutationObserver(() => {
        if (document.querySelector(TEXTAREA_SELECTOR)) {
            focusTextarea();
            observer.disconnect();
        }
    });

    observer.observe(document.body, {
        childList: true,
        subtree: true,
    });

    window.addEventListener('focus', focusTextarea);
}); 