<%@ page import="com.allmusic.Person" %>



			<div class="${hasErrors(bean: personInstance, field: 'firstName', 'error')} ">
				<label for="firstName" class="control-label"><g:message code="person.firstName.label" default="First Name" /></label>
				<div>
					<g:textField class="form-control" name="firstName" value="${personInstance?.firstName}"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'firstName', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: personInstance, field: 'lastName', 'error')} ">
				<label for="lastName" class="control-label"><g:message code="person.lastName.label" default="Last Name" /></label>
				<div>
					<g:textField class="form-control" name="lastName" value="${personInstance?.lastName}"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'lastName', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: personInstance, field: 'address', 'error')} ">
				<label for="address" class="control-label"><g:message code="person.address.label" default="Address" /></label>
				<div>
					<g:textArea class="form-control" name="address" cols="40" rows="5" maxlength="500" value="${personInstance?.address}"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'address', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: personInstance, field: 'dateBirth', 'error')} required">
				<label for="dateBirth" class="control-label"><g:message code="person.dateBirth.label" default="Date Birth" /><span class="required-indicator">*</span></label>
				<div>
					<bs:datePicker name="dateBirth" precision="day"  value="${personInstance?.dateBirth}"  />
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'dateBirth', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: personInstance, field: 'sex', 'error')} ">
				<label for="sex" class="control-label"><g:message code="person.sex.label" default="Sex" /></label>
				<div>
					<g:select class="form-control" name="sex" from="${personInstance.sexList}" value="${personInstance?.sex}" optionValue="value" optionKey="key" valueMessagePrefix="person.sex" noSelection="['': '']"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'sex', 'error')}</span>
				</div>
			</div>

			<div class="${hasErrors(bean: personInstance, field: 'email', 'error')} ">
				<label for="email" class="control-label"><g:message code="person.email.label" default="Email" /></label>
				<div>
					<g:textField class="form-control" name="email" value="${personInstance?.email}"/>
					<span class="help-inline">${hasErrors(bean: personInstance, field: 'email', 'error')}</span>
				</div>
			</div>

