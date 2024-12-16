/**
 * 
 */
 
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
      // item.innerHTML = `<strong>${key}:</strong> ${value}`;
      item.innerHTML = `${value}`;
    }

    container.appendChild(item);

  });
}
 