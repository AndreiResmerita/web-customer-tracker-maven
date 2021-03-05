package WebCustomerTracker.spring.dao;

import WebCustomerTracker.spring.entity.Customer;

import java.util.List;

public interface CustomerDAO {

     List<Customer>getCustomers(int theSortField);

    void saveCustomer(Customer customer);

    Customer getCustomer(int id);

    void delete(int id);

    List<Customer> searchCustomers(String theSearchName);

}
