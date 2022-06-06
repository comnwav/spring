<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>

		<style>
			#header {
				background-color: antiquewhite;
			}

			#footer {
				background-color: antiquewhite;
			}
		</style>

		<body>
			<div align="center">
				<table>
					<tr id="header">
						<td height="100">
							<tiles:insertAttribute name="header" />
						</td>
					</tr>
					<tr id="body">
						<td height="400">
							<tiles:insertAttribute name="body" />
						</td>
					</tr>
					<tr id="footer">
						<td height="100">
							<tiles:insertAttribute name="footer" />
						</td>
					</tr>
				</table>
			</div>
		</body>

		</html>