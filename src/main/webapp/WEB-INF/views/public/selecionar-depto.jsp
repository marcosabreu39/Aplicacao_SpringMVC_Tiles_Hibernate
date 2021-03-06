<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:choose>
 <c:when test="${fn:contains(mensagem, 'Erro')}">
 <c:set var="classe" value="alert alert-danger"/>  
 </c:when>
 
 <c:otherwise>
 <c:set var="classe" value="text-info"/>
 </c:otherwise> 
  </c:choose>
  
 <div class="${classe}" role="alert">
 <h3 id="titulo">${mensagem}</h3>
 </div>

<c:url value="/cadastro/selecionar-depto/concluir" var="url" />

<fieldset class="form-group">
	
<legend class="scheduler-border">Selecionar Departamento</legend>

<div style="text-align: center">

<c:set var="empregado" value="${empregado}" scope="session"/>

<table class="table table-inverse table-hover">

	<tr scope="row">
		<td>Nome:</td>
		<td>${empregado.nome}</td>
	</tr>
	<tr scope="row">
		<td>Endere�o:</td>
		<td>${empregado.endereco}</td>
	</tr>
	<tr scope="row">
		<td>CPF:</td>
		<td>${empregado.cpf}</td>
	</tr>
		
</table>	

</div>

<form:form method="post" action="${url}" commandName="departamento">
	
	<div class="form-group row">
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<div class="btn-group">		
		<form:select cssClass="form-control" path="id" id="exampleSelect1">
			<form:option value="" selected="true" disabled="true" readonly="true" label="Selecione o departamento do empregado" cssStyle="display: none;" />
			<form:options items="${departamentos}"  itemLabel="nomeDepartamento" itemValue="id"  />		
		</form:select>				
		</div>
		</div>
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		
		<button type="submit" class="btn btn-default" >Finalizar Cadastro <span class="glyphicon glyphicon-save"></span></button>
		</div>
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<form:errors path="id" class="form-control alert alert-danger" />		
		</div>
	</div>	
		
</form:form>

</fieldset>
