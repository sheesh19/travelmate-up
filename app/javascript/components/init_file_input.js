// https://benmarshall.me/styling-file-inputs/
const initFileInput = () => {
    var inputs = document.querySelectorAll('input[type="file"]');
    
    if (inputs) {
        Array.prototype.forEach.call(inputs, function (input) {
            var label = input.previousElementSibling,
                labelVal = label.innerHTML;
    
            input.addEventListener('change', function (e) {
                var fileName = '';
    
                if (this.files && this.files.length > 1) {
                    fileName = (this.getAttribute('data-multiple-caption') || '').replace('{count}', this.files.length);
                } else {
                    fileName = e.target.value.split('\\').pop();
                }
    
                if (fileName) {
                    const fileUrl = URL.createObjectURL(event.target.files[0]);
                    label.innerHTML = `<span class="file-input-preview"><img src="${fileUrl}" alt="file preview"< class="file-preview" id="file-preview" /></span> ${fileName} <br> <div class="btn btn-outlined mt-3"> Change </div> `;
                    label.classList.add('file-selected');
    
                    // const existingFilePreview = document.getElementById('file-preview');
                    // if (existingFilePreview) {
                    //   existingFilePreview.remove();
                    // }
    
                    // input.insertAdjacentHTML('beforebegin', `<div>img src="${fileUrl}" alt="file preview"< class="file-preview" id="file-preview" /></div>`);
                } else {
                    label.innerHTML = labelVal;
                    label.classList.remove('file-selected');
                }
            });
        });
    }
}

export { initFileInput };