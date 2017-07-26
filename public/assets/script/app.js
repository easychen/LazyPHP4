
/*
send form data via ajax and show the return content in front of the form
*/
function send_form_in( name )
{
	return send_form( name , function( data ){ set_form_notice( name , data ) } );
}

/*
send form data via ajax and return the data to callback function
*/

function send_form( name , func )
{
	var url = $('#'+name).attr('action');

	var params = {};
	$.each( $('#'+name).serializeArray(), function(index,value)
	{
		params[value.name] = value.value;
	});


	$.post( url , params , func );
}

function set_form_notice( name , data )
{
	data = '<span class="label label-default lable-form">' + data + '</span>';

	if( $('#form_'+name+'_notice').length != 0 )
	{
		$('#form_'+name+'_notice').html(data);
	}
	else
	{
		var odiv = $( "<div class='form_notice'></div>" );
		odiv.attr( 'id' , 'form_'+name+'_notice' );
		odiv.html(data);
		$('#'+name).prepend( odiv );
	}

}