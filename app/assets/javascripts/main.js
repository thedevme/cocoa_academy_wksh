
//get the current time in unix timestamp seconds

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

	});
