package com.migration;

import com.migration.entity.Passenger;
import com.migration.util.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;

public class JpaExample {
    public static void main(String[] args) {
        EntityManager entityManager = JpaUtil.getEntityManager();
        EntityTransaction transaction = null;

        try {
            transaction = entityManager.getTransaction();
            transaction.begin();

            long id = 1L;
            Passenger passenger = entityManager.find(Passenger.class, id);
            if (passenger != null) {
                // Update the name
                passenger.setFirstName("John Doe");
            } else {
                System.out.println("Employee with ID " + id + " not found");
            }

            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            throw e; // or handle it appropriately
        } finally {
            entityManager.close();
        }
    }
}
