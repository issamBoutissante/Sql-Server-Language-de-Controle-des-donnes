-- creer un login
exec sp_addlogin 'issam','1234'
-- supprimer un login
exec sp_droplogin 'issam'
-- pour creer un login herite de windows authentication
exec sp_grantlogin 'DESKTOP-45U2IQS\test'
exec sp_defaultdb 'DESKTOP-45U2IQS\test' , 'master'
-- supprimer un login herite de windows authentication
exec sp_denylogin 'DESKTOP-45U2IQS\test'
alter login [DESKTOP-45U2IQS\test] disable
-- donner un login l'acces a une base de donne
exec sp_grantdbaccess 'issam' 
-- empecher un login d'acces a une base de donne
exec sp_revokedbaccess 'issam'
-- creer un utilisateur
exec sp_adduser 'issam','user1','db_datareader'
-- supprimer un utilisateur
exec sp_dropuser 'user1'
-- creer un role
exec sp_addrole 'myrole'
-- supprimer un role
exec sp_droprole 'myrole'
-- ajouter un role a un utilisateur
exec sp_addrolemember 'db_datawriter','user1'
-- supprimer un role pour un utilisateur
exec sp_droprolemember 'db_datawriter','user1'
-- ajouter un role a un login
exec sp_addsrvrolemember 'issam','sysadmin'
-- supprimer un role pour un login
exec sp_dropsrvrolemember 'issam','sysadmin'
-- autoriser l'insertion dans la table 'test' pour un utilisateur
grant insert on test to user1
-- empecher un utilisateur d'inserer les donne dans la table 'test'
deny insert on test to user1
-- autoriser la mise a jour dans un cullonne de table 'test'
grant update(id) on test to user1
-- autoriser l'insertion dans la table 'test' pour un role
grant insert on test to myrole
-- supprimer le droit de selectioner de la table 'test'
revoke select on test to user1
-- autoriser et donne l'authourisation de donner l'autorization a les outres utilisateurs
grant insert on test to user1 with grant option