dataSource {
	pooled = true
	driverClassName = "com.mysql.jdbc.Driver"
	username = "vitaflo"
	password = "java1234"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='net.sf.ehcache.hibernate.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
                    // dbCreate = "create-drop" // one of 'create', 'create-drop','update'
                    dbCreate = 'update'
                    url = "jdbc:mysql://localhost/vitaflo_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
                hibernate {
                    show_sql=true
                }
	}
	test {
		dataSource {
			//dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_db_uat?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	vitaflo {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	medgen {
		dataSource {
			dbCreate = "update"
						url = "jdbc:mysql://localhost/medgen_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	medgen_us {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost/medgen_us_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
	innova {
		dataSource {
			dbCreate = "update"
                        url = "jdbc:mysql://localhost/vitaflo_db?useUnicode=true&characterEncoding=utf-8&autoReconnect=true"
		}
	}
}
