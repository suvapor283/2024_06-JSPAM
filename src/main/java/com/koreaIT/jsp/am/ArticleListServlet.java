package com.koreaIT.jsp.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.koreaIT.jsp.am.config.Config;
import com.koreaIT.jsp.am.util.DBUtil;
import com.koreaIT.jsp.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/article/list")
public class ArticleListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Connection connection = null;

		try {
			Class.forName(Config.getDBDriverName());
			connection = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUsr(), Config.getDBPW());
			
			int cPage = 1;

			if (request.getParameter("page") != null && request.getParameter("page").length() != 0) {
				cPage = Integer.parseInt(request.getParameter("page"));
			}
			
			int itemsInAPage = 10;
			
			int limitFrom = (cPage - 1) * itemsInAPage;
			
			int from = ((cPage - 1) / itemsInAPage) * 10 + 1;
			int end =  (((cPage - 1) / itemsInAPage) + 1) * 10;
			
			SecSql sql = new SecSql();
			sql.append("SELECT COUNT(id) FROM article");
			
			int totalCnt = DBUtil.selectRowIntValue(connection, sql);
			
			int totalPageCnt = (int) Math.ceil((double) totalCnt / itemsInAPage);
					
			sql = new SecSql();
			sql.append("SELECT * FROM article");
			sql.append("ORDER BY id DESC");
			sql.append("LIMIT ?, ?", limitFrom, itemsInAPage);
			
			List<Map<String, Object>> articleListMap = DBUtil.selectRows(connection, sql);
			
			request.setAttribute("cPage", cPage);
			request.setAttribute("from", from);
			request.setAttribute("end", end);
			request.setAttribute("totalPageCnt", totalPageCnt);
			request.setAttribute("articleListMap", articleListMap);
			
			request.getRequestDispatcher("/jsp/article/list.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
}