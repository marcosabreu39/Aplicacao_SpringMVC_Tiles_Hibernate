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

<c:url value="/atualizar-dados/listar-empregados/listar-selecionado" var="url" />

<fieldset class="form-group">
	
<legend class="scheduler-border">Selecionar Empregado</legend>

<form:form method="post" action="${url}" commandName="empregado">
	
	<div class="form-group row">
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<div class="btn-group">
		<form:select cssClass="form-control" path="cpf" id="exampleSelect1">
			<form:option value="" selected="true" disabled="true" readonly="true" label="Selecione o empregado que quer visualizar" cssStyle="display: none;" />
			<form:options items="${empregados}"  itemLabel="nome" itemValue="cpf"  />		
		</form:select>				
		</div>
		</div>
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		
		<button type="submit" class="btn btn-default">Visualizar dados do empregado <span class="glyphicon glyphicon-th-list"></span></button>
		</div>
		<label class="col-sm-3 control-label"></label>
		<div class="col-sm-4">
		<form:errors path="cpf" class="form-control alert alert-danger" />		
		</div>
	</div>	

</form:form>

</fieldset>