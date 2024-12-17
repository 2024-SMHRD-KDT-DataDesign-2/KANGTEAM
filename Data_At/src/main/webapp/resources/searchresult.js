 // 20번 반복해서 데이터 블록 생성
    const container = document.getElementById('dataContainer');

    for (let i = 1; i <= 20; i++) {
        const block = document.createElement('div');
        block.className = 'datablock';

        block.innerHTML = `
            <div class="thumbnail"></div>
            <div class="block-content">
                <div>
                    <a class="title">fruit and animals</a>
                </div>
                <div>
                    <p>uploaded in 24-12-15 by <span class="underline">chickenlove</span></p>
                </div>
            </div>
        `;

        container.appendChild(block);
    }