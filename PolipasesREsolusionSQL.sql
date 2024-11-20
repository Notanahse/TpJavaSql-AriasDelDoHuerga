/*En la base de datos, hay una plantilla por jugador*/
/*Triggers*/
/*Inserts posiciones, al principio la lista de jugadores estan vacias*/
DELIMITER //
create trigger verificar_futbolista
BEFORE insert on Jugadores
FOR EACH ROW
BEGIN
IF(exists(select * from Managers WHERE IdPersona = NEW.idPersona2)) 
THEN signal sqlstate '45000' set message_text =  'No se puede insertar el jugador, porque es un manager'; 
END IF;
END//
create trigger verificar_manager
BEFORE insert on Managers
FOR EACH ROW
BEGIN
IF(exists(select * from Jugadores WHERE idPersona2 = NEW.IdPersona)) 
THEN signal sqlstate '45000' set message_text =  'No se puede insertar el manager, porque es un jugador'; 
END IF;
END//
DELIMITER //
CREATE TRIGGER transferir_jugador
AFTER UPDATE on Fichaje
FOR EACH ROW
BEGIN
declare id_equipo int default 0;
declare posicion int default 0;
select Posiciones_idPosiciones into posicion FROM Plantilla WHERE idJugador = new.IdJugadores;
IF(new.EstadoDelFichaje = "HECHO") THEN
select idEquipoFutbol into id_equipo from Plantilla where idJugador=new.IdJugadores;
delete from Plantilla where idEquipoFutbol=id_equipo and idJugador=new.IdJugadores;
INSERT INTO Plantilla (idPlantilla, idJugador, Posiciones_idPosiciones, NumeroDorsal, idEquipoFutbol) 
VALUES (null, new.IdJugadores, posicion, null, new.idEquipoFutbol);
end if;
END//
DELIMITER //
CREATE TRIGGER insertar_posiciones 
AFTER UPDATE on Plantilla
FOR EACH ROW
BEGIN
INSERT INTO Posiciones (idPosiciones, Descripcion, JugadoresConvocados)
VALUES (new.Posiciones_idPosiciones, null, new.idJugador);
END//

/*a)*/
delimiter //
create procedure ListadoClub (in idClub int)
	Begin 
    Select idJugador, Persona.Nombre, Persona.Apellido from Plantilla join Jugadores on idJugador=IdJugadores join Persona on idPersona=idPersona2 where idEquipoFutbol=idClub;
    end//
delimiter ;
drop procedure ListadoClub;
/*b)*/
delimiter //
create function todosDeUnaPosicion (posicion int, club int)
returns int
not deterministic 
reads SQL data
	begin
	declare cantidad int;
    select count(*) into cantidad from Plantilla where 
    Posiciones_idPosiciones = posicion and idEquipoFutbol = club;
    return cantidad;
END//
delimiter ;
 drop function todosDeUnaPosicion;
/*c)*/    
delimiter //
create function managerJugadoresclub (managerID int, clubID int)
returns int
not deterministic
reads SQL data
Begin 
	declare cantidad int;
    set cantidad=0;
    select count(*) into cantidad from Plantilla where 
    idEquipoFutbol= clubID and idJugador in(select idJugadores from Jugadores
    where representante=managerID);
    return cantidad;
End //
delimiter ;
drop function managerJugadoresclub;
/*d)*/
delimiter //
create procedure MejorPagado ()
begin
	select * from Jugadores  where Salario= (select max(Salario) from Jugadores);
End//
delimiter ; 
/*e)*/
delimiter //
create function clubMasJugadoresPosicion(posicion int)
returns varchar(255)
not deterministic
reads SQL data
begin
declare nomb varchar(255);
 select nombre into nomb from EquipoFutbol join Plantilla on 
 EquipoFutbol.idEquipoFutbol = Plantilla.idEquipoFutbol
 where  Plantilla.idEquipoFutbol = (select ide from (select idEquipoFutbol as ide, count(*) as cant 
 from Plantilla where Posiciones_idPosiciones=posicion
 group by idEquipoFutbol order by cant asc limit 1) as subQueary)limit 1;
return nomb;
end //
delimiter ;
drop function clubMasJugadoresPosicion;
call ListadoClub(4);
select todosDeUnaPosicion(3,7);
select managerJugadoresclub(28,6);
call MejorPagado;
select clubMasJugadoresPosicion(3) into @ad;
select @ad;


 
 
 
 
 
