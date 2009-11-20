dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "vitaflo"
	password = "java1234"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='com.opensymphony.oscache.hibernate.OSCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
                    // dbCreate = "create-drop" // one of 'create', 'create-drop','update'
                    dbCreate = 'update'
                    url = "jdbc:mysql://spmdb/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8"
		}
                hibernate {
                    show_sql=true
                }
	}
	test {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_sistema?useUnicode=true&characterEncoding=utf-8"
		}
	}
}
