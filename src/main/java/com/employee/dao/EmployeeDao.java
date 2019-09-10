package com.employee.dao;

import com.employee.model.Employee;
import com.employee.tools.DbUtil;

import java.sql.*;
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
    //删除方法
    public boolean deleteId(int id){
        try {
            String sql = "delete from employee where id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            int i = ps.executeUpdate();
            if (i!=0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    //添加方法
    public boolean add(Employee employee){
        try {
            String sql = "insert into employee (id,name, sex,age) values(null,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getSex());
            ps.setInt(3,employee.getAge());
            int i = ps.executeUpdate();
            if (i!=0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }    //添加方法
    public boolean update(Employee employee){
        try {
            String sql = "update employee set name=?,sex=?,age=? where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,employee.getName());
            ps.setString(2,employee.getSex());
            ps.setInt(3,employee.getAge());
            ps.setInt(4,employee.getId());
            int i = ps.executeUpdate();
            if (i!=0){
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
