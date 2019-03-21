<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="/css/nucleo.css" rel="stylesheet">
  <link href="https://cdn.staticfile.org/font-awesome/5.7.2/css/fontawesome.min.css" rel="stylesheet">
  <link type="text/css" href="/css/argon.css" rel="stylesheet">
</head>


{$ssr_prefer = URL::SSRCanConnect($user, $mu)}

<body>


	
              <div class="nav-wrapper">
                <ul class="nav nav-pills nav-fill  flex-md-row" id="tabs-text" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0 active" id="qr_card-tab" data-toggle="tab" href="#qr_card" role="tab" aria-controls="qr_card" aria-selected="true">二维码扫描</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0" id="detail_card-tab" data-toggle="tab" href="#detail_card" role="tab" aria-controls="detail_card" aria-selected="false">手动配置</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link mb-sm-3 mb-md-0" id="json_card-tab" data-toggle="tab" href="#json_card" role="tab" aria-controls="json_card" aria-selected="false">JSON文件</a>
                  </li>
                </ul>
              </div>
			  
              <div class="card shadow">
                <div class="card-body">
                  <div class="tab-content" id="myTabContent">
<div class="tab-pane fade show active" id="qr_card" role="tabpanel" aria-labelledby="qr_card-tab">
<div class="text-center">
<p style="color:red">{$prefix}</p>
<p id="ssrtitle">SSR二维码</p>
	<div id="ssrdiv" class="text-center">
		<a href="{URL::getItemUrl($ssr_item, 0)}"><div id="ss-qr-n"></div></a>
	</div>
		<p>手机点击二维码即可跳转APP导入</p>
</div>
</div>


                    <div class="tab-pane fade show " id="detail_card" role="tabpanel" aria-labelledby="detail_card-tab">
				<div class="text-center">
<p style="color:red">{$prefix}</p>
<p id="detailtitle">SSR配置信息</p>
		<div id="detailssrdiv" class="text-center">
          {if URL::SSRCanConnect($user, $mu)}
		{$ssr_item = URL::getItem($user, $node, $mu, $relay_rule_id, 0)}
																										<p>服务器地址：{$ssr_item['address']}<br>
													服务器端口：{$ssr_item['port']}<br>
													加密方式：{$ssr_item['method']}<br>
													密码：{$ssr_item['passwd']}<br>
													协议：{$ssr_item['protocol']}<br>
													协议参数：{$ssr_item['protocol_param']}<br>
													混淆：{$ssr_item['obfs']}<br>
													混淆参数：{$ssr_item['obfs_param']}<br></p>
												{else}
													<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
													<p>同时, ShadowsocksR 单端口多用户的连接不受您设置的影响,您可以在此使用相应的客户端进行连接~</p>
												{/if}
													</div>
	
</div>
                 </div>



                    <div class="tab-pane fade show" id="json_card" role="tabpanel" aria-labelledby="json_card-tab">
				<div class="text-center">
<p style="color:red">{$prefix}</p>
<p id="jsontitle">SSR配置信息</p>
		<div id="jsonssrdiv" class="text-center">
	{if URL::SSRCanConnect($user, $mu)}
												<textarea class="form-control" rows="6">
{
    "server": "{$ssr_item['address']}",
    "local_address": "127.0.0.1",
    "local_port": 1080,
    "timeout": 300,
    "workers": 1,
    "server_port": {$ssr_item['port']},
    "password": "{$ssr_item['passwd']}",
    "method": "{$ssr_item['method']}",
    "obfs": "{$ssr_item['obfs']}",
    "obfs_param": "{$ssr_item['obfs_param']}",
    "protocol": "{$ssr_item['protocol']}",
    "protocol_param": "{$ssr_item['protocol_param']}"
}
												</textarea>
											{else}
												<p>您好，您目前的 加密方式，混淆，或者协议设置在 ShadowsocksR 客户端下无法连接。请您选用 Shadowsocks 客户端来连接，或者到 资料编辑 页面修改后再来查看此处。</p>
											{/if}
	</div>
	
</div>
                 </div>
                 </div>
                 </div>
                 </div>









  </main>
<script src="https://cdn.staticfile.org/jquery/3.3.1/jquery.min.js"></script>
  <script src="/js/popper.min.js"></script>
	<script src="/js/jquery.md5.js"></script>
	<script src="/js/gt.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script src="https://cdn.staticfile.org/headroom/0.9.4/headroom.min.js"></script>
</body>
</html>


<script src="/assets/public/js/jquery.qrcode.min.js"></script>
<script>
	
		var text_qrcode2 = '{URL::getItemUrl($ssr_item, 0)}';
	jQuery('#ss-qr-n').qrcode({
      	correctLevel :0,
    	width: 200,
    	height: 200,
		text: text_qrcode2
	});
	

</script>
<script src="https://cdn.godann.com/kitui/js/switch.js"></script>
