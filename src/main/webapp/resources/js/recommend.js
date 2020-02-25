		$(document)
				.ready(
						function() {
							$
									.getJSON(
											'http://api.openweathermap.org/data/2.5/weather?id=1835848&APPID=44b647d32d3a2207ba2169b2aa1a7f92&units=metric',
											function(data) {
												var nowTemp = data.main.temp;
												var humidity = data.main.humidity;
												var dayCondition;
												if (nowTemp > 20) {
													dayCondition = '더운날';
												} else if (nowTemp > 5) {
													dayCondition = '선선한날';
												} else {
													dayCondition = '추운날';
												}
												$('#dayCondition').append(
														dayCondition);
												$('#ctemp').append(nowTemp);
												$
														.ajax({
															url : "weather.eat",
															type : "post",
															dataType : "json",
															data : {
																"dayCondition" : dayCondition
															},
															success : function(
																	adata) {
																var thum = "/oxo/mainlist/"
																		+ adata.mf_filename
																//alert(adata.mf_filename);
																$(
																		'.recommendTitle')
																		.append(
																				adata.ml_title);
																$(
																		'.recommendMenu')
																		.append(
																				adata.ml_menu);
																$('#thumNail')
																		.attr(
																				"src",
																				thum);
																$(
																		'#recommendID > span')
																		.attr(
																				"id",
																				adata.ml_no);
															},
															error : function() {
																alert('통신에러');
															}
														});
											});
							//추천메뉴 검색하기
							$('.listMenu').click(function() {
								var searchTitle = $(this).text();
								//alert(searchTitle);						
								$('#contents').val(searchTitle);
								$('#frm').submit();
							});
							//추천맛집 검색하기
							$('.listTitle').click(
									function() {
										var no = $(this).attr('id');
										$(location).attr(
												'href',
												'/oxo/ineatlist/info.eat?ml_no='
														+ no);
									});
							//날씨추천메뉴 검색하기
							$('#recommendID').click(
									function() {
										var no = $('#recommendID > span').attr(
												'id');
										$(location).attr(
												'href',
												'/oxo/ineatlist/info.eat?ml_no='
														+ no);
									});
							//마우스 아이콘, text스타일  변경
							$('.list-group-item > h3').hover(function() {
								$(this).css({
									"cursor" : "pointer"
								});
							});
						});