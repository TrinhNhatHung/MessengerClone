$('.expand-btn-photo').click((event) => {
	$('.expand-btn-photo i').toggleClass('expand-toggled');
	$('.expanded-photo').toggleClass('none');
})

$('.expand-btn-info').click((event) => {
	$('.expand-btn-info i').toggleClass('expand-toggled');
	$('.expanded-info').toggleClass('none');
})

$('.expand-btn-file').click((event) => {
	$('.expand-btn-file i').toggleClass('expand-toggled');
	$('.expanded-file').toggleClass('none');
})

$(".expand-button").click(function () {
	$(".profile").toggleClass("expanded");
	$(".contacts").toggleClass("expanded");
});

$(document).ready(function () {
	$('.image-link').magnificPopup({
		type: 'image',
		delegate: 'a.image-send',
		gallery: {
			enabled: true
		},
	});

	$('.expanded-photo').magnificPopup({
		type: 'image',
		delegate: 'a.photo-shared',
		gallery: {
			enabled: true
		},
	});
});

$('.attachment-image').on('click', (event) => {
	$('.input-image').trigger('click');
});

$('.attachment-file').on('click', (event) => {
	$('.input-file').trigger('click');
});

setTimeout(function () {
	$("#messages").animate({
		scrollTop: $('#messages').prop("scrollHeight")
	}, 1);
}, 200);

