package com.employee.dao;

import com.employee.model.Employee;
import com.employee.tools.DbUtil;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDao {
    private Connection connection;
    public EmployeeDao() {
        connection = DbUtil.getConnection();
    }
    public List<Employee> getAllEmployees() {
        List<Employee> employeesList = new ArrayList<Employee>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from employee");
            while (rs.next()) {
                Employee employee = new Employee();
                employee.setId(rs.getInt("id"));
                employee.setName(rs.getString("name"));
                employee.setSex(rs.getString("sex"));
                employee.setAge(rs.getInt("age"));
                employeesList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return employeesList;
    }
}
