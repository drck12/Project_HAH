const toggleBtn = document.querySelector('.three');
const sidebar = document.querySelector('.sidebar');
const body_wrapper = document.querySelector('.body_wrapper');
const barright = document.querySelector('.sidebar_right');
const footer_wrapper = document.querySelector('.footer_wrapper');


toggleBtn.addEventListener('click', () => {
   sidebar.classList.toggle('toggle_sidebar');
   body_wrapper.classList.toggle('toggle_body');
    barright.classList.toggle('toggle_right');
    footer_wrapper.classList.toggle('toggle_footer');
    
   
});


$(document).ready(function(){
  $(".hamburger").click(function(){
    $(this).toggleClass("is-active");
  });
});



var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
	type : 'bar',
	data : {
		labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
				'Orange' ],
		datasets : [ {
			label : '# of Votes',
			data : [ 12, 19, 3, 5, 2, 3 ],
			backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)' ],
			borderColor : [ 'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)' ],
			borderWidth : 1
		} ]
	},
	options : {
		scales : {
			y : {
				beginAtZero : true
			}
		}
	}
});


const labels = [
	  'January',
	  'February',
	  'March',
	  'April',
	  'May',
	  'June',
	];
	const data = {
	  labels: labels,
	  datasets: [{
	    label: 'My First dataset',
	    backgroundColor: 'rgb(255, 99, 132)',
	    borderColor: 'rgb(255, 99, 132)',
	    data: [0, 10, 5, 2, 20, 30, 45],
	  }]
	};
	const config = {
	  type: 'line',
	  data,
	  options: {}
	};
	  var myChart1 = new Chart(
	    document.getElementById('myChart1'),
	    config
	  );