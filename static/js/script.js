document.addEventListener('DOMContentLoaded', () => {
    const downloadButton = document.getElementById('download-button');
    const downloadContainer = document.querySelector('.download-container');
    const loader = document.querySelector('.download-animation');
    const message = document.querySelector('.download-message');
    const progress = document.querySelector('.download-progress');

    downloadButton.addEventListener('click', async () => {
        // Show the animation container
        downloadContainer.style.display = 'flex';

        // Start the animation
        loader.style.display = 'block';
        message.textContent = 'Downloading...';

        const video_url = document.getElementById('video_url').value;
        try {
            const response = await fetch('/download', {
                method: 'POST',
                body: JSON.stringify({ video_url }),
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            const data = await response.json();

            if (data.status === 'success') {
                // Simulate progress update every second
                let progressValue = 0;
                const interval = setInterval(() => {
                    if (progressValue <= 100) {
                        progress.value = progressValue;
                        progressValue += 10;
                    } else {
                        clearInterval(interval);
                        loader.style.display = 'none';
                        message.textContent = 'Download Complete';
                    }
                }, 1000);
            }
        } catch (error) {
            console.error(error);
            message.textContent = 'Download failed.';
        }
    });
});
