CREATE TABLE IF NOT EXISTS `availablecontracts` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `requester` varchar(60) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(60) NOT NULL,
  `items` JSON() NOT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;