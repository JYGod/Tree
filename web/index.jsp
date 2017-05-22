<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/5/22 0022
  Time: 9:03
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
  <base href="<%=basePath%>">
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>NgJsTree Demo Page</title>

  <link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/bootstrap-3.3.4.css">
  <link rel="stylesheet" href="demo/bower_components/jstree/dist/themes/default/style.min.css">
  <link rel="stylesheet" href="demo/bower_components/AngularJS-Toaster/toaster.css">
  <link rel="stylesheet" href="demo/bower_components/angular-busy/dist/angular-busy.css">
  <style>
    body {
      padding-top: 50px;
    }
  </style>
</head>
<body ng-app="ngJsTreeDemo">


<div class="container" ng-controller="treeCtrl as vm">
  <div class="row">
    <div class="col-xs-12 text-center">
      <h2><=======天国专用========></h2>
    </div>
  </div>
  <br/><br/>
  <div class="row" cg-busy="vm.promise">
    <toaster-container></toaster-container>
    <div class="col-xs-6">
      <div class="panel panel-default">
        <div class="panel-heading"><i class="glyphicon glyphicon-tree-conifer"></i>文件信息</div>
        <div class="panel-body">
          <div js-tree="vm.treeConfig" should-apply="vm.applyModelChanges()" ng-model="vm.treeData" tree="vm.treeInstance" tree-events="ready:vm.readyCB;create_node:vm.createCB"></div>
        </div>
      </div>
    </div>
    <div class="col-xs-6">

      <div class="panel panel-default">
        <div class="panel-heading">
          <i class="glyphicon glyphicon-plus"></i>添加结点</div>
        <div class="panel-body">
          <form class="form-horizontal" novalidate name="newNodeForm" role="form">
            <div class="form-group">
              <label for="addNode" class="col-xs-3 control-label">结点名字:</label>
              <div class="col-xs-9" ng-class="{ 'has-error' : newNodeForm.addNode.$invalid}">
                <input type="text" class="form-control" id="addNode" ng-model="vm.newNode.text" name="addNode" placeholder="输入结点名称..." required>
              </div>
            </div>
            <div class="form-group">
              <label for="nodeParent" class="col-xs-3 control-label">上层结点:</label>
              <div class="col-xs-9" ng-class="{ 'has-error' : newNodeForm.nodeParent.$invalid}">
                <select class="form-control" id="nodeParent" name="nodeParent" ng-model="vm.newNode.parent" required>
                  <option ng-repeat="node in vm.treeData" value="{{node.id}}">{{node.text}}[{{node.id}}]</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col-xs-12">
                <div class="pull-right">
                  <button type="button" ng-disabled="newNodeForm.$invalid" ng-click="vm.addNewNode()" class="btn btn-success">添加结点</button>
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>

    </div>
  </div>
  <div class="row" >
    <div class="col-xs-12">
      <form id="uploadForm" class="form-inline" action="json/save" >
        <input type="file" name="file1" id="browsefile" style="display:none">
        <input type="hidden" name="json" id="json" value="{{ vm.treeData | json }}">
        <input type="submit"  class="btn btn-success" value="保存数据">
      </form>
    </div>

    <div class="col-xs-12" style="margin-top: 20px;">
      <form  class="form-inline" action="json/select" >
      <input id="submitbtn" type="submit" class="btn btn-primary" value="更新数据"/>
      <input  type="button" class="btn btn-primary" value="刷新" onclick="update()"/>
      </form>
    </div>

  </div>
  <div class="row">
    <div class="col-xs-12">
      <b>数据源:</b> <pre>{{ vm.treeData | json }}</pre>
      <textarea style="display: none" id="jsonResult" ><%=request.getAttribute("resJson")%></textarea>
    </div>
  </div>
</div>

<script type="text/javascript">

  function save() {

  }
  function select() {
      window.location.href="json/select";
  }

    function update() {
        var data = window.document.getElementById("jsonResult").value;
        console.log("txt data:"+data);
        vm.update(data);

    }

</script>
<script src="demo/bower_components/jquery/jquery.min.js"></script>
<script src="demo/bower_components/bootstrap/bootstrap.min.js"></script>
<script src="demo/bower_components/angular/angular.min.js"></script>
<script src="demo/bower_components/angular-animate/angular-animate.min.js"></script>
<script src="demo/bower_components/angular-busy/dist/angular-busy.js"></script>
<script src="demo/bower_components/jstree/dist/jstree.min.js"></script>
<script src="demo/bower_components/AngularJS-Toaster/toaster.js"></script>
<script src="demo/bower_components/underscore/underscore-min.js"></script>
<script src="dist/ngJsTree.js"></script>
<script src="demo/app.js"></script>
<script src="demo/treeCtrl.js"></script>
</body>
</html>

