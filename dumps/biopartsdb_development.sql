/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50150
 Source Host           : localhost
 Source Database       : biopartsdb_development

 Target Server Type    : MySQL
 Target Server Version : 50150
 File Encoding         : utf-8

 Date: 05/23/2012 10:19:35 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `apcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `apcr_products`;
CREATE TABLE `apcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `apcr_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apcr_products_on_apcr_id` (`apcr_id`),
  KEY `index_apcr_products_on_quality_control_id` (`quality_control_id`),
  KEY `index_apcr_products_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `apcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `apcr_products` VALUES ('49', '5', '27', '1', '1', '2012-05-22 12:17:02', '2012-05-22 12:20:25'), ('50', '5', '27', '1', '2', '2012-05-22 12:17:02', '2012-05-22 12:20:25'), ('51', null, '28', '1', '1', '2012-05-22 14:12:23', '2012-05-22 14:13:53'), ('52', null, '28', '1', '2', '2012-05-22 14:12:23', '2012-05-22 14:13:53'), ('53', null, '29', '1', '1', '2012-05-23 13:22:08', '2012-05-23 13:22:15'), ('54', null, '29', '1', '2', '2012-05-23 13:22:08', '2012-05-23 13:22:15');
COMMIT;

-- ----------------------------
--  Table structure for `apcrs`
-- ----------------------------
DROP TABLE IF EXISTS `apcrs`;
CREATE TABLE `apcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apcrs_on_status_id` (`status_id`),
  KEY `index_apcrs_on_protocol_id` (`protocol_id`),
  KEY `index_apcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `apcrs`
-- ----------------------------
BEGIN;
INSERT INTO `apcrs` VALUES ('27', '5', '2', '1', '1', '2012-05-22 12:17:02', '2012-05-22 12:30:11'), ('28', '5', '2', '1', '1', '2012-05-22 14:12:23', '2012-05-22 14:13:53'), ('29', '5', '1', '1', '1', '2012-05-23 13:22:08', '2012-05-23 13:22:08');
COMMIT;

-- ----------------------------
--  Table structure for `device_types`
-- ----------------------------
DROP TABLE IF EXISTS `device_types`;
CREATE TABLE `device_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `device_types`
-- ----------------------------
BEGIN;
INSERT INTO `device_types` VALUES ('1', 'PCR machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `devices`
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_devices_on_device_type_id` (`device_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `devices`
-- ----------------------------
BEGIN;
INSERT INTO `devices` VALUES ('1', '1', 'Veriti I', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `features`
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definition` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `features`
-- ----------------------------
BEGIN;
INSERT INTO `features` VALUES ('1', 'SO:0000167', 'promoter', 'sequence', 'A regulatory_region composed of the TSS(s) and binding sites for TF_complexes of the basal transcription machinery.', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `fpcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `fpcr_products`;
CREATE TABLE `fpcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fpcr_id` int(11) DEFAULT NULL,
  `tpcr_product_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fpcr_products_on_user_id` (`user_id`),
  KEY `index_fpcr_products_on_fpcr_id` (`fpcr_id`),
  KEY `index_fpcr_products_on_tpcr_product_id` (`tpcr_product_id`),
  KEY `index_fpcr_products_on_quality_control_id` (`quality_control_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `fpcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `fpcr_products` VALUES ('1', null, '1', '1', '5', '2012-05-23 12:57:32', '2012-05-23 12:59:43'), ('2', null, '2', '1', null, '2012-05-23 13:02:52', '2012-05-23 13:02:52'), ('3', null, '3', '1', '5', '2012-05-23 13:22:46', '2012-05-23 13:22:53'), ('4', null, '3', '2', '5', '2012-05-23 13:22:46', '2012-05-23 13:22:53');
COMMIT;

-- ----------------------------
--  Table structure for `fpcrs`
-- ----------------------------
DROP TABLE IF EXISTS `fpcrs`;
CREATE TABLE `fpcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fpcrs_on_user_id` (`user_id`),
  KEY `index_fpcrs_on_status_id` (`status_id`),
  KEY `index_fpcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `fpcrs`
-- ----------------------------
BEGIN;
INSERT INTO `fpcrs` VALUES ('1', '5', '7', '3', '1', '2012-05-23 12:57:32', '2012-05-23 13:02:34'), ('2', '5', '6', '3', '1', '2012-05-23 13:02:52', '2012-05-23 13:02:52'), ('3', '5', '7', '3', '1', '2012-05-23 13:22:46', '2012-05-23 13:23:05');
COMMIT;

-- ----------------------------
--  Table structure for `locations`
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organism_id` int(11) DEFAULT NULL,
  `chromosome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `strand` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_organism_id` (`organism_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `locations`
-- ----------------------------
BEGIN;
INSERT INTO `locations` VALUES ('1', '1', 'chr02', '60736', '61198', '-1', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligo_plate_wells`
-- ----------------------------
DROP TABLE IF EXISTS `oligo_plate_wells`;
CREATE TABLE `oligo_plate_wells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oligo_plate_id` int(11) DEFAULT NULL,
  `oligo_id` int(11) DEFAULT NULL,
  `well` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligo_plate_wells_on_oligo_plate_id` (`oligo_plate_id`),
  KEY `index_oligo_plate_wells_on_oligo_id` (`oligo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligo_plate_wells`
-- ----------------------------
BEGIN;
INSERT INTO `oligo_plate_wells` VALUES ('1', '1', '1', 'A01', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligo_plates`
-- ----------------------------
DROP TABLE IF EXISTS `oligo_plates`;
CREATE TABLE `oligo_plates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligo_plates_on_vendor_id` (`vendor_id`),
  KEY `index_oligo_plates_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligo_plates`
-- ----------------------------
BEGIN;
INSERT INTO `oligo_plates` VALUES ('1', 'JHU_PARTS_2012_OLIGO_1', '1', '1', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligos`
-- ----------------------------
DROP TABLE IF EXISTS `oligos`;
CREATE TABLE `oligos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `sequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligos_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligos`
-- ----------------------------
BEGIN;
INSERT INTO `oligos` VALUES ('1', '1', 'yeast_promoter_YBL087C.o01', '1', '150', 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTAC', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `organisms`
-- ----------------------------
DROP TABLE IF EXISTS `organisms`;
CREATE TABLE `organisms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gbtaxonid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `organisms`
-- ----------------------------
BEGIN;
INSERT INTO `organisms` VALUES ('1', 'yeast', 'Saccharomyces cerevisiae', '4932', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `parts`
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_parts_on_location_id` (`location_id`),
  KEY `index_parts_on_sequence_id` (`sequence_id`),
  KEY `index_parts_on_feature_id` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `parts`
-- ----------------------------
BEGIN;
INSERT INTO `parts` VALUES ('1', 'yeast_promoter_YBL087C', '1', '1', '1', '2012-05-20 13:34:49', '2012-05-20 13:34:49'), ('2', 'yeast_gene_YBL087C', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `pcr_gel_images`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gel_images`;
CREATE TABLE `pcr_gel_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcr_gel_id` int(11) DEFAULT NULL,
  `pcr_gel_image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gel_images_on_pcr_gel_id` (`pcr_gel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `pcr_gel_lanes`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gel_lanes`;
CREATE TABLE `pcr_gel_lanes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcr_gel_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `pcr_product_id` int(11) DEFAULT NULL,
  `pcr_product_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gel_lanes_on_pcr_gel_id` (`pcr_gel_id`),
  KEY `index_pcr_gel_lanes_on_quality_control_id` (`quality_control_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `pcr_gels`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gels`;
CREATE TABLE `pcr_gels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gels_on_user_id` (`user_id`),
  KEY `index_pcr_gels_on_protocol_id` (`protocol_id`),
  KEY `index_pcr_gels_on_status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `plasmids`
-- ----------------------------
DROP TABLE IF EXISTS `plasmids`;
CREATE TABLE `plasmids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plasmids_on_vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `protocol_reagents`
-- ----------------------------
DROP TABLE IF EXISTS `protocol_reagents`;
CREATE TABLE `protocol_reagents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_concentration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_concentration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume_reaction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_protocol_reagents_on_protocol_id` (`protocol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `protocol_reagents`
-- ----------------------------
BEGIN;
INSERT INTO `protocol_reagents` VALUES ('1', null, null, null, null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `protocols`
-- ----------------------------
DROP TABLE IF EXISTS `protocols`;
CREATE TABLE `protocols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_protocols_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `protocols`
-- ----------------------------
BEGIN;
INSERT INTO `protocols` VALUES ('1', 'Apcr', 'PCR', 'a perfect pcr program', '5', '2012-05-20 17:38:30', '2012-05-20 17:38:36'), ('2', 'Tpcr', 'tPCR', 'perfect tpcr', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Fpcr', 'fPCR', 'perfect fPCR', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `quality_controls`
-- ----------------------------
DROP TABLE IF EXISTS `quality_controls`;
CREATE TABLE `quality_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `quality_controls`
-- ----------------------------
BEGIN;
INSERT INTO `quality_controls` VALUES ('1', 'Apcr', 'PASS', 'Successful PCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'Apcr', 'FAIL', 'Failing PCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('3', 'Tpcr', 'PASS', 'Successful tPCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('4', 'Tpcr', 'FAIL', 'Failing tPCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('5', 'Fpcr', 'PASS', 'Successful fPCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('6', 'Fpcr', 'FAIL', 'Failing fPCR', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `schema_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `schema_migrations` VALUES ('20120519235331'), ('20120519235438'), ('20120519235545'), ('20120519235611'), ('20120519235937'), ('20120520000405'), ('20120520004455'), ('20120520004522'), ('20120520004837'), ('20120520005554'), ('20120520124535'), ('20120520124730'), ('20120520125444'), ('20120520125515'), ('20120520125543'), ('20120520125611'), ('20120520145623'), ('20120521203336'), ('20120521203409'), ('20120521203509'), ('20120521203550'), ('20120521231022'), ('20120522175036'), ('20120522183620'), ('20120522183822'), ('20120522183859'), ('20120523131504'), ('20120523131603'), ('20120523132857');
COMMIT;

-- ----------------------------
--  Table structure for `sequences`
-- ----------------------------
DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `sequences`
-- ----------------------------
BEGIN;
INSERT INTO `sequences` VALUES ('1', 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTACCATGTTAATGATCCCCCAGATAAAAAGACAAGACAGAGCATATATCAGACTACATTAACATCTGTACACCCCCAACTGCTTTGAAAAAACCCATGCAGTTATTATTTTCAACAGACCAAGTTTTTTTATCGCTTATCCGGCTCACAGAACGAGCCGTACAACCGTCATCAGACTTGCATGGAAATGTTGAAAAAGAGGTAAAAAAGAAAATATCAAACCCAAACACGCTCGGGCTGAAAAATTAATATGGCAGGAAACGAACTGTAGCCATAATGTACCTGTTCCCGCTAATAGTAATACCATCGTATTGCTAAGGTTAGTAGCTAAAAATCTCTTACTTTCTTTATTTTGACTCTTAGGTCTTACAAGCAATACAAAACCAACACACCTATATATAACTAATA', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `statuses`
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `statuses`
-- ----------------------------
BEGIN;
INSERT INTO `statuses` VALUES ('1', 'Apcr', 'Pending', 'Reaction registered', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'), ('2', 'Apcr', 'Finished', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null), ('4', 'Tpcr', 'Pending', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'), ('5', 'Tpcr', 'Finished', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null), ('6', 'Fpcr', 'Pending', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'), ('7', 'Fpcr', 'Finished', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);
COMMIT;

-- ----------------------------
--  Table structure for `strains`
-- ----------------------------
DROP TABLE IF EXISTS `strains`;
CREATE TABLE `strains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organism_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_strains_on_organism_id` (`organism_id`),
  KEY `index_strains_on_vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `tasks`
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_user_id` (`user_id`),
  KEY `index_tasks_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tasks`
-- ----------------------------
BEGIN;
INSERT INTO `tasks` VALUES ('1', '5', '1', '2012-05-20 18:06:08', '2012-05-20 18:06:11');
COMMIT;

-- ----------------------------
--  Table structure for `tpcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `tpcr_products`;
CREATE TABLE `tpcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tpcr_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tpcr_products_on_user_id` (`user_id`),
  KEY `index_tpcr_products_on_tpcr_id` (`tpcr_id`),
  KEY `index_tpcr_products_on_quality_control_id` (`quality_control_id`),
  KEY `index_tpcr_products_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tpcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `tpcr_products` VALUES ('1', null, '1', '3', '1', '2012-05-23 12:54:40', '2012-05-23 12:57:21'), ('2', null, '2', '3', '1', '2012-05-23 13:22:29', '2012-05-23 13:22:34'), ('3', null, '2', '3', '2', '2012-05-23 13:22:29', '2012-05-23 13:22:34');
COMMIT;

-- ----------------------------
--  Table structure for `tpcrs`
-- ----------------------------
DROP TABLE IF EXISTS `tpcrs`;
CREATE TABLE `tpcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tpcrs_on_user_id` (`user_id`),
  KEY `index_tpcrs_on_status_id` (`status_id`),
  KEY `index_tpcrs_on_protocol_id` (`protocol_id`),
  KEY `index_tpcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tpcrs`
-- ----------------------------
BEGIN;
INSERT INTO `tpcrs` VALUES ('1', '5', '4', '2', '1', '2012-05-23 12:54:40', '2012-05-23 12:54:40'), ('2', '5', '4', '2', '1', '2012-05-23 13:22:29', '2012-05-23 13:22:29');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', null, 'Giovanni Stracquadanio', 'stracquadanio@jhu.edu', 'facebook', '2012-05-20 13:34:49', '2012-05-20 13:34:49'), ('5', 'https://www.google.com/accounts/o8/id?id=AItOawlskY2r6YJYF1OlA0bsQbVchl2T2M9prnA', 'Giovanni Stracquadanio', 'stracquadanio@gmail.com', 'google', '2012-05-20 21:26:18', '2012-05-21 00:33:31');
COMMIT;

-- ----------------------------
--  Table structure for `vendors`
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `vendors`
-- ----------------------------
BEGIN;
INSERT INTO `vendors` VALUES ('1', 'IDT', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
