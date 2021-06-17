let slider = document.getElementById("customRange");
let label = document.getElementById("label");
console.log("test");
slider.oninput = function() {
    label.innerHTML = slider.value;
    console.log(slider.value);
}