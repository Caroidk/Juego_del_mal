-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-01-2019 a las 15:48:30
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `juego_pokemon`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personajes`
--

CREATE TABLE `personajes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `nivel` int(11) DEFAULT '1',
  `fk_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personajes`
--

INSERT INTO `personajes` (`id`, `nombre`, `nivel`, `fk_usuario`) VALUES
(2, 'Enk', 1, 6),
(5, 'Lu', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokedexs`
--

CREATE TABLE `pokedexs` (
  `id` int(11) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `nivel` int(11) DEFAULT '1',
  `fk_pokemon` int(11) NOT NULL,
  `fk_personaje` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pokedexs`
--

INSERT INTO `pokedexs` (`id`, `alias`, `nivel`, `fk_pokemon`, `fk_personaje`) VALUES
(1, 'nn', 1, 1, 5),
(2, 'ao', 1, 2, 5),
(4, 'nn', 1, 4, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pokemons`
--

CREATE TABLE `pokemons` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `tipo` varchar(30) DEFAULT NULL,
  `especie` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `pokemons`
--

INSERT INTO `pokemons` (`id`, `nombre`, `tipo`, `especie`) VALUES
(1, 'bulbasour', 'planta/veneno', 'semilla'),
(2, 'charmander', 'fuego', 'lagartija'),
(3, 'squirtle', 'agua', 'tortuguita'),
(4, 'pikachu', 'electrico', 'raton');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `contraseña`, `email`, `fecha_creacion`, `telefono`) VALUES
(1, 'Katherine Berríos', 'kathy341', 'berkathy@gmail.com', '2019-01-03 20:45:53', 2147483647),
(2, 'Mauricio Sarmiento', 'ContraseñaOriginal', 'mauriciosm221@gmail.com', '2019-01-03 21:25:07', 993856993),
(3, 'Roberto Torres', 'ketepaloco13', 'rob_atb@hotmail.com', '2019-01-03 21:25:14', 994437124),
(4, 'Luis Galleguillos', 'DLE1401', 'lgalleguillos21.lg@gmail.com', '2019-01-03 21:29:15', 51334088),
(5, 'Daniel Villanueva', '2005', 'dvillanueva40@gmail.com', '2019-01-03 21:29:15', 949952608),
(6, 'joshe ramirez', '1234', 'joseinformatico2015@gmail.com', '2019-01-03 21:29:15', 983916160),
(7, 'Zenen Canales', '2019', 'zenefox@gmail.com', '2019-01-03 21:29:15', 990665950),
(8, 'David Moreno', '2019', 'davidalbertomoreno@outlook.com', '2019-01-03 21:29:15', 951780458),
(9, 'María Gutierrez Flores', 'maru123', 'gutierrez.mariau@gmail.com', '2019-01-03 21:29:15', 989320004),
(10, 'Miguel Ocque', '0412', 'migueocque@gmail.com', '2019-01-03 21:29:15', 944795895);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_usuario` (`fk_usuario`);

--
-- Indices de la tabla `pokedexs`
--
ALTER TABLE `pokedexs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_pokemon` (`fk_pokemon`),
  ADD KEY `fk_personaje` (`fk_personaje`);

--
-- Indices de la tabla `pokemons`
--
ALTER TABLE `pokemons`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personajes`
--
ALTER TABLE `personajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pokedexs`
--
ALTER TABLE `pokedexs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pokemons`
--
ALTER TABLE `pokemons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `personajes`
--
ALTER TABLE `personajes`
  ADD CONSTRAINT `personajes_ibfk_1` FOREIGN KEY (`fk_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `pokedexs`
--
ALTER TABLE `pokedexs`
  ADD CONSTRAINT `pokedexs_ibfk_1` FOREIGN KEY (`fk_pokemon`) REFERENCES `pokemons` (`id`),
  ADD CONSTRAINT `pokedexs_ibfk_2` FOREIGN KEY (`fk_personaje`) REFERENCES `personajes` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
