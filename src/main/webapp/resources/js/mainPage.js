// $(document).ready(function(){
// 	var slider = $(".slider");
// 	var imageWrapper = $(".imageWrapper")
// 	var imagesSet = [];
// 	var leftButton = slider.find(".left.arrow");
// 	var rightButton = slider.find(".right.arrow");



// 	function startSlider(){
// 		var items= imageWrapper.find("img");
// 		var itemsCount = items.length;
// 		var tempSlide = 0; 

// 		for (var i=0; i<itemsCount; i++){
// 			imagesSet.push($(items[i]).attr('src'));
// 		}


// 		leftButton.bind('click', function() {
//   			changeItem("left");
// 		});
// 		rightButton.bind('click', function() {
//   			changeItem("right");
// 		});

// 		function changeItem(input){
// 			var slide = null;
// 			switch (input){
// 				case "left":
// 				slide = imagesSet[1];
// 				break
// 				case "right":
// 				console.log("fdd");
// 				break
// 			}
// 			imageWrapper.find("img.active").animate({
//         		opacity: 0
//        		}, 500 )
// 			.animate({
//         		opacity: 1
//             }, 500 );
		
// 		setTimeout(function(){
// 			imageWrapper.find("img.active").attr("src", slide);
// 		},500);
// 	}

	
// }
// 	startSlider();
// });