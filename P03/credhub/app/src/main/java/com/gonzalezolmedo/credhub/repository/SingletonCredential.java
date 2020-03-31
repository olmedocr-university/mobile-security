package com.gonzalezolmedo.credhub.repository;

public class SingletonCredential {
        public String username = null;
        public String password = null;

        public String dbPassword = null;

        // Getter/setter

        private static SingletonCredential instance;

        public static SingletonCredential getInstance() {
            if (instance == null)
                instance = new SingletonCredential();
            return instance;
        }

        private SingletonCredential() { }
}
