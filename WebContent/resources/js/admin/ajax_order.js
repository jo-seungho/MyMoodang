$(document).ready(
		function() {

			$('.pagination a').click(
					function(e) {
						e.preventDefault(); // 기본 이벤트 방지

						var url = $(this).attr('href'); // 페이지 URL 가져오기

						// 쿼리 스트링에서 page 값을 가져오기
						var page = url.split('?')[1].split('&').find(
								function(param) {
									return param.split('=')[0] === 'page';
								}).split('=')[1];
						var category = url.split('?')[1].split('&').find(
								function(param) {
									return param.split('=')[0] === 'category';
								}).split('=')[1];

						// 페이지 로드
						handleButtonClick(page, category);
					});

			// 브라우저 뒤로 가기/앞으로 가기 이벤트 핸들러 등록
			window.onpopstate = function(event) {
				if (event.state) {
					loadPage(event.state.page);
				}
			};

			$('.deleteBtn').click(function() {

				confirm('정말 삭제하시겠습니까?');

				if (confirm) {
					var orderNo = $('#orderNo').val();
					$.ajax({
						url : 'orderDelete.ad',
						type : 'get',
						data : {
							orderNo : orderNo,
						},
						success : function(data) {
							alert('주문이 삭제되었습니다.');
							window.location.reload();
						},
					});
				}
			});

			$('.modi').click(
					function() {
						var orderNo = $(this).parent().parent().parent()
								.children().eq(0).text();
						var status = $(this).parent().children().eq(0).val();
						$.ajax({
							url : 'orderStatus.ad',
							type : 'get',
							data : {
								orderNo : orderNo,
								status : status,
							},
							success : function(data) {
								alert('주문상태가 변경되었습니다.');
								window.location.reload();
							},
						});
					});

			function handleButtonClicked(page, category, search, value) {
				$('.btn').removeClass('underline');

				$(this).addClass('underline');

				$.ajax({
					url : 'order.ad',
					type : 'get',
					data : {
						page : page,
						category : category,
						search : search,
						value : value
					},
					success : function(list) {
						$('main').html(list);
					},
					error : function() {
						console.log('댓글리스트 조회용 ajax 통신 실패');
					},
				});
			}

			function handleButtonClick(page, category) {
				$('.btn').removeClass('underline');

				$(this).addClass('underline');

				$.ajax({
					url : 'order.ad',
					type : 'get',
					data : {
						page : page,
						category : category
					},
					success : function(list) {
						$('main').html(list);
					},
					error : function() {
						console.log('댓글리스트 조회용 ajax 통신 실패');
					},
				});
			}

			$('#btn1').click(function() {
				handleButtonClick.call(this, '1', 'A');
			});
			$('#btn2').click(function() {
				handleButtonClick.call(this, '1', 'B');
			});
			$('#btn3').click(function() {
				handleButtonClick.call(this, '1', 'C');
			});
			$('#btn4').click(function() {
				handleButtonClick.call(this, '1', 'D');
			});

			$('.searchBtn').click(function() {
				var search = $('input[name="search"]').val();
				var value = $('select[name="value"]').val();
				var page = $('input[name="page"]').val();
				var category = $('input[name="category"]').val();

				handleButtonClicked(page, category, search, value);
			});

			$('tbody').on(
					'click',
					'td',
					function() {
						var getOrderNo = $(this).closest('tr').find('td:eq(0)')
								.text();
						$.ajax({
							url : 'selectOrder.ad',
							type : 'get',
							data : {
								orderNo : getOrderNo
							},

							success : function(result) {
								console.log(result);
								if (result != null) {
									console.log(result);
									// 모달에게 값을 전달
									$('#orderNo').val(result.orderNo);
									$('#memberId').val(result.memberId);
									$('#itemList').val(result.itemList);
									$('#request').val(result.request);
									$('#phone').val(result.phone);
									$('#orderDate').val(
											result.orderDate.replace(/\t+/g,
													" "));
									$('#orderstatus').val(result.orderStatus);
									$('#pay').val(result.paymentAmount + '원');
									$('#shipAddr').val(result.shipAddr);
									$('#img').attr('src', result.imagePath);
									
									$('#myModal').modal('show');
								}
							},
							error : function(e) {
								alert('회원을 조회할 수 없습니다');
							},
						});
					});

			// dropdown-menu에 있는 값 가져와서 input에 넣기
			$('.drop1 li a').click(function() {
				var text = $(this).text();
				$(this).parents('.input-group').find('#orderstatus').val(text);
			});

		});