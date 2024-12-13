const dropZone = document.getElementById('drop-zone');
const fileSystem = document.getElementById('file-system');
const fileList = document.getElementById('file-list');

// Add drag-and-drop events
dropZone.addEventListener('dragover', (event) => {
  event.preventDefault();
  dropZone.classList.add('dragover');
});

dropZone.addEventListener('dragleave', () => {
  dropZone.classList.remove('dragover');
});

dropZone.addEventListener('drop', (event) => {
  event.preventDefault();
  dropZone.classList.remove('dragover');
  
  const file = event.dataTransfer.files[0];
  if (!file || file.type !== 'application/json') {
    alert('Please drop a valid JSON file.');
    return;
  }

  const reader = new FileReader();
  reader.onload = (e) => {
    const json = JSON.parse(e.target.result);
    fileSystem.innerHTML = ''; // Clear previous content
    displayJsonStructure(json, fileSystem);
    displayJsonAsList(json, fileList); // Pass the JSON to the display function
  };
  reader.readAsText(file);
});

// JSON 파일 이미지 출력 
    function displayJsonStructure(json, container) {
  console.log("Object.entries(json) 길이 :" + Object.entries(json).length);
  let cnt = 0; // 출력한 이미지 개수
  let imgGroup = document.createElement('div');
  imgGroup.className = 'image-group';

  Object.entries(json).forEach(([key, value]) => {
    const isFolder = typeof value === 'object' && value !== null;

    if (isFolder) {
      const element = document.createElement('div');
      element.className = 'folder';

      const subContainer = document.createElement('div');
      subContainer.className = 'sub-folder';

      element.addEventListener('click', function () {
        element.classList.toggle('open');
      });

      container.appendChild(element);
      container.appendChild(subContainer);
      displayJsonStructure(value, subContainer);
    } else {
      const valueImage = document.createElement('img');
      valueImage.className = 'value';
      valueImage.setAttribute("src", value);
      valueImage.setAttribute("alt", "이미지실패ㅎㅎ");

      imgGroup.appendChild(valueImage);
      cnt++;

      if (cnt % 3 === 0) {
        container.appendChild(imgGroup);
        imgGroup = document.createElement('div');
        imgGroup.className = 'image-group';
      }
    }
  });

  // Append remaining images if any
  if (imgGroup.children.length > 0) {
    container.appendChild(imgGroup);
  }
}

// JSON 파일 목록 출력.
function displayJsonAsList(json, container) {
  Object.entries(json).forEach(([key, value]) => {
    const item = document.createElement('div');
    item.className = 'json-item';

    if (typeof value === 'object' && value !== null) {
      // Nested object handling
      const keyElement = document.createElement('div');
      keyElement.className = 'json-key';
      keyElement.innerText = `${key}:`;

      const nestedContainer = document.createElement('div');
      nestedContainer.className = 'nested-container';
      displayJsonAsList(value, nestedContainer); // Recursive call for nested objects

      item.appendChild(keyElement);
      item.appendChild(nestedContainer);
    } else {
      // Key-value pair
      item.innerHTML = `<strong>${key}:</strong> ${value}`;
    }

    container.appendChild(item);
  });
}

