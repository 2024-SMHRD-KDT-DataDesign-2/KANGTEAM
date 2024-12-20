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

$(document).ready(function () {
  const img_id = $("#img_id").val() ;

  $.ajax({
  	url : "jsonImageSelect",
  	type : "POST",
  	data : {"img_id" : img_id},
  	success : function (response) {
  	  console.log("jsonImage : ", response) ;
  		
	  const file = response ;
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
  	},
  	error : function() {
  		alert("실패") ;
  	}
  }) ;
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

       if (cnt % 5 === 0) {
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
  
  // json 파일 드래그 div 삭제
  document.getElementById('drop-zone').style.display = ('none');
}


