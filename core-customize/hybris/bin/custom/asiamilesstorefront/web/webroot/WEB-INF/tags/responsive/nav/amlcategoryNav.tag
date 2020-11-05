<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="columns" required="true"
	type="de.hybris.platform.cms2.model.navigation.CMSNavigationNodeModel"%>

<div class="group">
	<a class="font-SemiBold level__one" href="${columns.entries[0].item.localizedUrl}">
		<span class="level__one--name">${columns.title}</span>
		<c:if test="${not empty columns.children}">
			<svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
				<g fill="none" fill-rule="evenodd" transform="translate(5 8)">
					<path d="M15 0v8.414H0V0z"/>
					<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
				</g>
         </svg>
		</c:if> <!-- TODO add link -->
	</a>
	<c:if test="${not empty columns.children}">
		<c:forEach items="${columns.children}" var="childLevel2">
			<a class="level__two"
				href="${childLevel2.entries[0].item.localizedUrl}">
				<span>${childLevel2.title}</span> <c:if
					test="${not empty childLevel2.children}">
					<svg class="icon-arrow" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24" height="24" viewBox="0 0 24 24">
						<g fill="none" fill-rule="evenodd" transform="translate(5 8)">
							<path d="M15 0v8.414H0V0z"/>
							<path fill="#272F38" d="M7.5 8.414a.908.908 0 0 1-.646-.268L0 1.292 1.292 0 7.5 6.208 13.707 0 15 1.292 8.146 8.146a.91.91 0 0 1-.646.268"/>
						</g>
               </svg>
				</c:if>
			</a>
			<c:if test="${not empty childLevel2.children}">
				<c:forEach items="${childLevel2.children}" var="childLevel3">
					<a class="level__three" href="${childLevel3.entries[0].item.localizedUrl}"> 
						<span>${childLevel3.title}</span>
					</a>
				</c:forEach>
			</c:if>
		</c:forEach>
	</c:if>
</div>
