// JavaScript Document
var jcrop_api;
function scope_fun(){

    // Create variables (in this scope) to hold the API and image size
        boundx,
        boundy,
		
        // Grab some information about the preview pane
        $preview = $('.preview-pane'),
        $pcnt = $('.preview-pane '),
        $pimg = $('.preview-pane img'),

        xsize0 = $($pcnt[0]).width(),
        ysize0 = $($pcnt[0]).height(),
        xsize1 = $($pcnt[1]).width(),
        ysize1 = $($pcnt[1]).height(),
        xsize2 = $($pcnt[2]).width(),
        ysize2 = $($pcnt[2]).height();
    $('#target').Jcrop({
      onChange: updatePreview,
      onSelect: updatePreview,
      aspectRatio: xsize0 / ysize0
    },function(){
		// Use the API to get the real image size
		var bounds = this.getBounds();
		boundx = bounds[0];
		boundy = bounds[1];
		// Store the API in the jcrop_api variable
		jcrop_api = this;
		
		// Move the preview into the jcrop container for css positioning
      	$preview.appendTo(jcrop_api.ui.holder);

		$('#coords').on('change','input',function(e){
		  var x1 = $('#x1').val(),
			  x2 = $('#x2').val(),
			  y1 = $('#y1').val(),
			  y2 = $('#y2').val();
		  jcrop_api.setSelect([x1,y1,x2,y2]);
		});
		
		jcrop_api.animateTo([0,0,160,160]);
	});
 
    function releaseCheck()
    {
      jcrop_api.setOptions({ allowSelect: true });
    };

    function updatePreview(c)
    {
      if (parseInt(c.w) > 0)
      {
		calc($($pimg[0]), xsize0, ysize0,boundx,boundy, c ); 
		calc($($pimg[1]), xsize1, ysize1,boundx,boundy, c );
		calc($($pimg[2]), xsize2, ysize2,boundx,boundy, c );
      }
	  
	  showCoords(c);
    };

  };
  
var calc=function($target, xsize,ysize,boundx,boundy, $source){
        var rx = xsize / $source.w;
        var ry = ysize / $source.h;

        $target.css({
          width: Math.round(rx * boundx) + 'px',
          height: Math.round(ry * boundy) + 'px',
          marginLeft: '-' + Math.round(rx * $source.x) + 'px',
          marginTop: '-' + Math.round(ry * $source.y) + 'px'
        });
};

  function showCoords(c)
  {
    $('#x1').val(c.x);
    $('#y1').val(c.y);
    $('#x2').val(c.x2);
    $('#y2').val(c.y2);
    $('#w').val(c.w);
    $('#h').val(c.h);
  };

  function clearCoords()
  {
    $('#coords input').val('');
  };
  
  function scope_fun(){

	    // Create variables (in this scope) to hold the API and image size
	       var boundx,
	        boundy,
			
	        // Grab some information about the preview pane
	        $preview = $('.preview-pane'),
	        $pcnt = $('.preview-pane '),
	        $pimg = $('.preview-pane img'),

	        xsize0 = $($pcnt[0]).width(),
	        ysize0 = $($pcnt[0]).height(),
	        xsize1 = $($pcnt[1]).width(),
	        ysize1 = $($pcnt[1]).height(),
	        xsize2 = $($pcnt[2]).width(),
	        ysize2 = $($pcnt[2]).height();
	    $('#target').Jcrop({
	      onChange: updatePreview,
	      onSelect: updatePreview,
	      aspectRatio: xsize0 / ysize0
	    },function(){
			// Use the API to get the real image size
			var bounds = this.getBounds();
			boundx = bounds[0];
			boundy = bounds[1];
			// Store the API in the jcrop_api variable
			jcrop_api = this;
			
			// Move the preview into the jcrop container for css positioning
	      	$preview.appendTo(jcrop_api.ui.holder);

			$('#coords').on('change','input',function(e){
			  var x1 = $('#x1').val(),
				  x2 = $('#x2').val(),
				  y1 = $('#y1').val(),
				  y2 = $('#y2').val();
			  jcrop_api.setSelect([x1,y1,x2,y2]);
			});
			
			jcrop_api.animateTo([0,0,160,160]);
		});
	 
	    function releaseCheck()
	    {
	      jcrop_api.setOptions({ allowSelect: true });
	    };

	    function updatePreview(c)
	    {
	      if (parseInt(c.w) > 0)
	      {
			calc($($pimg[0]), xsize0, ysize0,boundx,boundy, c ); 
			calc($($pimg[1]), xsize1, ysize1,boundx,boundy, c );
			calc($($pimg[2]), xsize2, ysize2,boundx,boundy, c );
	      }
		  
		  showCoords(c);
	    };
	  }
