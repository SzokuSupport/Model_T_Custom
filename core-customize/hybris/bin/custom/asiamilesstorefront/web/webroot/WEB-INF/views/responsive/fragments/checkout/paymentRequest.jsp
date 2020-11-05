<%@ page trimDirectiveWhitespaces="true" contentType="application/json" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="amljson" uri="http://aml.com/tld/jsonescape" %>
<%@ taglib prefix="payment" tagdir="/WEB-INF/tags/responsive/checkout" %>

{"status": "${paymentRequest.status}",
"code":"${paymentRequest.code}",
"requestUrl":"${paymentRequest.requestUrl}",
"paymentRequestForm":"<amljson:jsonEscape jsonEscape="true">
 <payment:paymentForm formId="paymentRequestForm" postUrl="${paymentRequest.requestPostUrl}" formFields="${paymentRequest.requestFields}"/>
</amljson:jsonEscape>"
}
