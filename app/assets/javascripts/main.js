
//get the current time in unix timestamp seconds


//jQuery to collapse the navbar on scroll
// for stuff like this you should really debounce instead
/*
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
		      $('.navbar-header').addClass('scrolling');
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
		      $('.navbar-header').removeClass('scrolling');
    }

		if ( $(window).scrollTop() > 500 ) {
    } else {
  }
});
*/


//jQuery for page scrolling feature - requires jQuery Easing plugin
// $(function() {
//     $('a.page-scroll').bind('click', function(event) {
//         var $anchor = $(this);
//         $('html, body').stop().animate({
//             scrollTop: $($anchor.attr('href')).offset().top
//         }, 1500, 'easeInOutExpo');
//         event.preventDefault();
//     });
// });




var seconds = new Date().getTime() / 1000;

// var endTime = 'Your end time';


if($(".clock").length > 0){
	$('.clock').final_countdown({

		'start': 1452232800,
		'end': 1452313800,
		'now': seconds,

		seconds: {
			borderColor: '#2c3e50',
			borderWidth: '5'
		},
		minutes: {
			borderColor: '#2c3e50',
			borderWidth: '5'
		},
		hours: {
			borderColor: '#2c3e50',
			borderWidth: '5'
		},
		days: {
			borderColor: '#2c3e50',
			borderWidth: '5'
		}

	});

}

//Affix Navigation
// if($(".main-header").length > 0){
// 	$('.main-header').affix({
// 		offset: {
// 			top: 50
// 		}
// 	});
// }




if($(".tabs").length > 0){
	$(".tabs").tabs();
}


/*event-filter*/
$(".stylegrid").addClass('active');
$('.grid-list').addClass('itemgrid');

$(".event-filter li.filter").click(function(e){
	$(this).addClass('active');
	$(this).siblings().removeClass('active');

	if ( $( this ).hasClass( "stylelist" ) ) {
		$('.grid-list').addClass('itemlist');
		$('.grid-list').removeClass('itemgrid');
		$('.itemlist .col-md-4').addClass('col-md-12').removeClass('col-md-4');
		$('.itemlist .col-md-3').addClass('col-md-12').removeClass('col-md-3');
	}

	if ( $( this ).hasClass( "stylegrid" ) ) {
		$('.grid-list').addClass('itemgrid');
		$('.grid-list').removeClass('itemlist');
		$('.itemgrid .col-md-12').addClass('col-md-4').removeClass('col-md-12');
		$('.checkcolumn.itemgrid .col-md-4').addClass('col-md-3').removeClass('col-md-4');
	}

	e.preventDefault();
});




//Drop-Down Menu
$(".main-nav li,.main-nav .sub-menu li").hover(function (){
	$('a', this).addClass('current');
	$(this).children('ul').css({visibility: "visible", display: "none"}).slideDown(400);
}, function () {
	$('a', this).removeClass('current');
	$('ul', this).css({visibility: "hidden", display: "none"});
});

//moblie menu

$(".mobile-menu-icon").click(function(){

	$('.mobile-menu ul').slideToggle(400);
});


$(window).on('load', function() {
    var nextYear = (new Date().getFullYear() + 1) + "/01/12/",
      template = _.template($('#upcomeing-events-template').html()),
      currDate = '00:00:00:00',
      nextDate = '00:00:00:00',
      parser = /([0-9]{2})/gi;
    // Parse countdown string to an object

    function strfobj(str) {
      var parsed = str.match(parser),
        obj = {};
      obj['weeks'] = parsed[0];
      obj['days'] = parsed[1];
      obj['hours'] = parsed[2];
      obj['minutes'] = parsed[3];
      obj['seconds'] = parsed[4];
      return obj;
    }

    // Return the time components that diffs
    function diff(obj1, obj2) {
      var diff = [];
      ['weeks', 'days', 'hours', 'minutes', 'seconds'].forEach(function(key) {
        if (obj1[key] !== obj2[key]) {
          diff.push('.' + key);
        }
      });
      return diff;
    }


    // Starts the countdown
    $('#upcomeing-events').countdown(nextYear, function(event) {
      var newDate = event.strftime('%w:%d:%H:%M:%S'),
        data, $countdown;
      if (newDate !== nextDate) {
        $countdown = $(this);
        currDate = nextDate;
        nextDate = newDate;
        // Setup the data
        data = {
          'curr': strfobj(currDate),
          'next': strfobj(nextDate)
        };
        // Update the template
        $countdown.html(template(data));
        // Delay this function to after this callback
        _.delay(function() {
          $countdown.find(diff(data.curr, data.next).join(', '))
            .addClass('animate')
        }, 1);
      }
    });
  });
	jQuery(document).ready(function($) {

	   'use strict';
	//OWLCAROUSEL SCHEDULE
	var timetable = $("#timetable");
  var days = $("#days");

  timetable.owlCarousel({
    singleItem : true,
    slideSpeed : 1000,
    navigation: false,
    pagination:false,
    afterAction : syncPosition,
    responsiveRefreshRate : 200,
  });

  days.owlCarousel({
   	items : 4,
    itemsMobile       : [479,4],
    pagination:false,
    responsiveRefreshRate : 100,
    afterInit : function(el){
      el.find(".owl-item").eq(0).addClass("synced");
    }
  });

  function syncPosition(el){
    var current = this.currentItem;
    $("#days")
      .find(".owl-item")
      .removeClass("synced")
      .eq(current)
      .addClass("synced")
    if($("#days").data("owlCarousel") !== undefined){
      center(current)
    }
  }

  $("#days").on("click", ".owl-item", function(e){
    e.preventDefault();
    var number = $(this).data("owlItem");
    timetable.trigger("owl.goTo",number);
  });

  function center(number){
    var daysvisible = days.data("owlCarousel").owl.visibleItems;
    var num = number;
    var found = false;
    for(var i in daysvisible){
      if(num === daysvisible[i]){
        var found = true;
      }
    }

    if(found===false){
      if(num>daysvisible[daysvisible.length-1]){
        days.trigger("owl.goTo", num - daysvisible.length+2)
      }else{
        if(num - 1 === -1){
          num = 0;
        }
        days.trigger("owl.goTo", num);
      }
    } else if(num === daysvisible[daysvisible.length-1]){
      days.trigger("owl.goTo", daysvisible[1])
    } else if(num === daysvisible[0]){
      days.trigger("owl.goTo", num-1)
    }

  }

	//COUNTDOWN TIMER
	var newYear = new Date();
    newYear = new Date(newYear.getFullYear() + 1, 1 - 1, 1);
    $('#countdown').countdown({until: new Date(2014, 12-1, 18)}); // enter event day

    $('#removeCountdown').toggle(
        function() {
            $(this).text('Re-attach');
            $('#defaultCountdown').countdown('destroy');
        },
        function() {
            $(this).text('Remove');
            $('#defaultCountdown').countdown({until: newYear});
        }
    );

	//MILESTONE
  // $('.timer').countTo();
	// $('.register').magnificPopup({type: 'ajax'});

  // SIGNUP FORM
    var _frm    = $('#subForm'),
        _email  = _frm.find('#fieldEmail'),
        _btn    = _frm.find('button[type=submit]'),
        _help   = _frm.find('#emailHelp'),
        _to     = 0;

    _frm.submit(function(){
      if (Validate.email(_email.val()) === false){
        _help.html('Please enter a valid email to signup.').removeClass('hide').addClass('alert');
        _to = window.setTimeout(hideMessage,4000,_help)
      } else {
        _btn.prop('disabled',true);
        window.clearTimeout(_to);
        $.ajax({
          url       : _frm.attr('action'),
          data      : _frm.serialize(),
          type      : 'POST',
          dataType  : 'json'
        })
          .done(function(response){
            if (response.status === false){
              _help.html(response.message).removeClass('hide success').addClass('alert');
            }
            else{
              _help.html(response.message).removeClass('hide alert').addClass('success');
              _email.val('');
            }
            _to = window.setTimeout(hideMessage,4000,_help)
          })
          .always(function(){
           _btn.prop('disabled',false);
          });
      }
      return false;
    });

    _email.on('keyup',function(){
      if (!_help.hasClass('hide'))
          hideMessage(_help);
    })
	});

  function hideMessage(_help){
      _help.removeClass('alert success').addClass('hide');
  }

/**
* https://github.com/GiancarloGomez/javascript.validation
* A little gift from my validation scripts :-)
*
* Validate()
* @hint Global Validate object which can be used to validate a string to a specified format
*/
var Validate = {
    'date': function(value){
        return !(/Invalid|NaN/).test(new Date(value));
    },
    'dateTime': function(value){
        return !(/Invalid|NaN/).test(new Date(value));
    },
    'email': function(value){
        return (/^[_a-zA-Z0-9\-]+((\.[_a-zA-Z0-9\-]+)*|(\+[_a-zA-Z0-9\-]+)*)*@[a-zA-Z0-9\-]+(\.[a-zA-Z0-9\-]+)*(\.[a-zA-Z]{2,4})$/i).test(value);
    },
    'float': function(value){
        return (/^[\-+]?[0-9]*\.?[0-9]+$/).test(value);
    },
    'integer': function (value){
        return (/^\d+$/).test(value);
    },
    'slug': function(value) {
        return (/^[a-z0-9]{3,}(?:(-|_)[a-z0-9]+)*$/).test(value);
    },
    'slugWithPeriod': function(value) {
        return (/^[a-z0-9]{2,}(?:(-|\.|_)[a-z0-9]+)*$/).test(value);
    },
    // links for class or type validation
    'datepicker': function(value){
        return Validate.date(value);
    },
    'datetime': function(value){
        return Validate.date(value);
    },
    'number': function (value){
        return Validate.integer(value);
    },
    'time': function(value){
        return Validate.dateTime(value);
    },
    'timepicker': function(value){
        return Validate.dateTime(value);
    },
    'username': function(value) {
        return Validate.slugWithPeriod(value);
    }
};
