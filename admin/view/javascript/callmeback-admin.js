$(document).ready(function() {
	var collection = Array();

	$('.callmeback-tabs-mini li').eq(0).addClass('active');
	$('.callmeback-tabs li').eq(0).addClass('active');
	$('.callmeback-tabs-mini li').on('click', function(){
		var $this = $(this),
		tabToOpen = '.callmeback-tabs li.' + $this.data('tab-to-open');
		$('.callmeback-tabs li').removeClass('active');
		$('.callmeback-tabs-mini li').removeClass('active');
		$(tabToOpen).addClass('active');
		$this.addClass('active');
	});


	// add new field
	$('#content.callmeback .add-new-field').on('click', function(e){
		$(this).hide();
		$('#content.callmeback .add-confirm').show();
		$('.option-popup').fadeIn(300);
		e.preventDefault();
	});
	$("body").on('click', function (event) {
		if ($(event.target).closest("#content.callmeback .add-new-field, #content.callmeback .add-confirm, .option-popup").length === 0) {
			$('#content.callmeback .add-confirm').hide();
			$('#content.callmeback .add-new-field').show();

			// hide popup
			$('.option-popup').fadeOut(300);
			$('#content.callmeback .option-popup .param-box').fadeOut(300);

			// clear unused params
			$('#add-box-name, #add-box-sort, #add-field-name, #add-field-placeholder, #add-field-sort, #add-field-default-value').val('');
			$('#add-box-default-value').attr('checked', false);
		}
	});

	$('#content.callmeback .add-confirm').on('click', function(e){
		
		$('#content.callmeback .add-confirm').hide();
		$('#content.callmeback .add-new-field').show();

		// hide popup
		$('.option-popup').fadeOut(300);
		$('#content.callmeback .option-popup .param-box').fadeOut(300);

		// Parse data 
		parseFieldParams (collection);
		updateInputs(collection);

		// clear unused params
		$('#add-box-name, #add-box-sort, #add-field-name, #add-field-placeholder, #add-field-sort, #add-field-default-value').val('');
		$('#add-box-default-value').attr('checked', false);

		e.preventDefault();
	});

	$('#content.callmeback .option-popup .type-box input').on('click', function(){
		var checkedRadio = $('#content.callmeback .option-popup .type-box input:checked').val();

		if (checkedRadio == 'text' || checkedRadio == 'textarea') {

			// Close other params
			$('#content.callmeback .option-popup .param-box.param-button').hide();

			// Open current params
			$('#content.callmeback .option-popup .param-box.param-text').fadeIn(300);

			// clear unused params
			$('#add-box-name, #add-box-sort').val('');
			$('#add-box-default-value').attr('checked', false);
			
		} else{

			// Close other params
			$('#content.callmeback .option-popup .param-box.param-text').hide();

			// Open current params
			$('#content.callmeback .option-popup .param-box.param-button').fadeIn(300);

			// clear unused params
			$('#add-field-name, #add-field-placeholder, #add-field-sort, #add-field-default-value').val('');
		};
	});

	// Edit settings autosave - field-prop - to collection
	$('body').on('change', '.edit-params input', function(){
		var $this = $(this);
		collection[$this.data('input-name')][$this.data('input-prop')] = $this.val();
	});

	$('body').on('click', '#fields > li > div.title', function(){
		$(this).closest('li').find('.edit-params').slideToggle(300);
	});

	$('body').on('click', '#fields .remove-field', function(e){
		var $this = $(this);
		$this.closest('li').find('.edit-params').slideUp(300);
		delete collection[$this.closest('li').find('input').eq(0).data('input-name')];
		updateInputs(collection);

		e.preventDefault();
	});

	// saveModulSettings(data);
});

// add parameters of ner input to collection
function parseFieldParams (collection) {
	var newInput = {},
		checkedRadio = $('#content.callmeback .option-popup .type-box input:checked').val();

// Parse data 
	if (checkedRadio == 'text' || checkedRadio == 'textarea') {
		newInput['type'] = $('#content.callmeback .option-popup .type-box input:checked').val();
		newInput['name'] = $('#add-field-name').val();
		newInput['sort'] = $('#add-field-sort').val();
		newInput['placeholder'] = $('#add-field-placeholder').val();
		newInput['default-value'] = $('#add-field-default-value').val();
	} else{
		newInput['type'] = $('#content.callmeback .option-popup .type-box input:checked').val();
		newInput['name'] = $('#add-box-name').val();
		newInput['sort'] = $('#add-box-sort').val();
		if ($('#content.callmeback .option-popup .param-button input:checked').val()) {
			newInput['checked'] = $('#content.callmeback .option-popup .param-button input:checked').val();
		} else {
			newInput['checked'] = false;
		};
	};
	if (newInput['name'].length) {
		collection[newInput['name']] = newInput;
	};
	newInput = null;
};

//Build inputs from collection
function updateInputs(collection){
	var newInput = null,
		inputType;
	$('#fields').children().remove();

	for (var i = 0; i < Object.keys(collection).length; i++) {
		inputType = collection[Object.keys(collection)[i]]['type'];
		if (collection[Object.keys(collection)[i]]['type'] == 'text' || collection[Object.keys(collection)[i]]['type'] == 'textarea') {
			newInput = createNewTextInputItem(collection,i);
		};

		if (collection[Object.keys(collection)[i]]['type'] == 'checkbox') {};
		if (collection[Object.keys(collection)[i]]['type'] == 'radio') {};
		$('#fields').append(newInput);
		newInput = null
	};


};

function createNewTextInputItem(collection,i){
	var inputType = collection[Object.keys(collection)[i]]['type'],
		newInput = '<li class="' 
			+ collection[Object.keys(collection)[i]]['type']
			+ '" id="edit-params-'
			+ i
			+ '"><div class="title">'
			+ '<b>'
			+ collection[Object.keys(collection)[i]]['name']
			+ '</b>'
			+ '<span>&nbsp;('
			+ 'текстовое поле'
			+ ')</span><a href="#" class="remove-field"></a></div>'
			+ '<div class="edit-params">'
			+ '<h6 class="title">Параметры поля <b>"'
			+ collection[Object.keys(collection)[i]]['name']
			+ '"</b></h6><table>'
			+ '<tr><td><label for="edit-field-placeholder-'
			+ i
			+ '">Плейсхолдер</label></td><td><input type="text" name="edit_placeholder" value="'
			+ collection[Object.keys(collection)[i]]['placeholder']
			+ '" placeholder="" id="edit-field-placeholder-'
			+ i
			+ '" data-input-name="'
			+ collection[Object.keys(collection)[i]]['name']
			+ '" data-input-prop="placeholder"></td></tr>'
			+ '<tr><td><label for="edit-field-sort-'
			+ i
			+ '">Сортировка</label></td><td><input type="text" name="edit_default_value" value="'
			+ collection[Object.keys(collection)[i]]['sort']
			+ '" placeholder="" id="edit-field-sort'
			+ i
			+ '" data-input-name="'
			+ collection[Object.keys(collection)[i]]['name']
			+ '" data-input-prop="sort"></td></tr>'
			+ '<tr><td><label for="edit-field-default-value-'
			+ i
			+ '">Значение по умолчанию</label></td><td><input type="text" name="edit_default_value" value="'
			+ collection[Object.keys(collection)[i]]['default-value']
			+ '" placeholder="" id="edit-field-default-value-'
			+ i
			+ '" data-input-name="'
			+ collection[Object.keys(collection)[i]]['name']
			+ '" data-input-prop="default-value"></td></tr></table></div>'
			+ '</li>';
		return newInput;
};

function saveModulSettings(data){
	console.log(data);
	$.ajax({
	  url: '/admin/index.php?route=module/callmebackmodul/',
	  type: "POST",
	  data: data, //'product_id=' + product_id + '&quantity=' + quantity,
	  success: function(){

	},
	  dataType: 'json'
	});

}


// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 



function Callback () {
	this.$el = $('#callback-form');
	this.$addField = $('#callback-form #add');

	this.collection = [];

	this.init();
};


Callback.prototype.init = function() {
	this.bindEvnts();
};

Callback.prototype.bindEvnts = function() {
	this.$addField.on('click', $.proxy(this.add, this));
};

Callback.prototype.add = function(e) {
	this.collection.push({name: 'title'});

	this.render();
};

Callback.prototype.render = function() {
	var html = '';

	$.each(function(index, model) {
		html += Handlebars.compile(model);
	});

	this.$el.html(html);
};