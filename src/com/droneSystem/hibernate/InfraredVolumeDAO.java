package com.droneSystem.hibernate;

import java.util.List;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * A data access object (DAO) providing persistence and search support for
 * Task entities. Transaction control of the save(), update() and delete()
 * operations can directly support Spring container-managed transactions or they
 * can be augmented to handle user-managed Spring transactions. Each of these
 * methods provides additional information for how to configure it for the
 * desired type of transaction control.
 * 
 * @see com.droneSystem.hibernate.Task
 * @author MyEclipse Persistence Tools
 */

public class InfraredVolumeDAO extends BaseHibernateDAO {
	private static final Logger log = LoggerFactory
			.getLogger(InfraredVolumeDAO.class);
	// property constants
	public static final String VIDEO = "video";
	public static final String TIME = "time";
	public static final String DRONE = "drone";
	public static final String INFRAREDVOLUME = "InfraredVolume";
	

	public void save(InfraredVolume transientInstance) {
		log.debug("saving InfraredVolume instance");
		try {
			getSession().save(transientInstance);
			log.debug("save successful");
		} catch (RuntimeException re) {
			log.error("save failed", re);
			throw re;
		}
	}

	public void delete(InfraredVolume persistentInstance) {
		log.debug("deleting InfraredVolume instance");
		try {
			getSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public InfraredVolume findById(java.lang.Integer id) {
		log.debug("getting InfraredVolume instance with id: " + id);
		try {
			InfraredVolume instance = (InfraredVolume) getSession().get(
					"com.droneSystem.hibernate.InfraredVolume", id);
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(InfraredVolume instance) {
		log.debug("finding InfraredVolume instance by example");
		try {
			List results = getSession().createCriteria(
					"com.droneSystem.hibernate.InfraredVolume").add(
					Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}

	public List findByProperty(String propertyName, Object value) {
		log.debug("finding InfraredVolume instance with property: " + propertyName
				+ ", value: " + value);
		try {
			String queryString = "from InfraredVolume as model where model."
					+ propertyName + "= ?";
			Query queryObject = getSession().createQuery(queryString);
			queryObject.setParameter(0, value);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
			throw re;
		}
	}

	public List findByVideo(Object video) {
		return findByProperty(VIDEO, video);
	}

	public List findByTime(Object time) {
		return findByProperty(TIME, time);
	}
	
	public List findByDrone(Object drone) {
		return findByProperty(DRONE, drone);
	}
	
	public List findByInfraredVolume(Object InfraredVolume) {
		return findByProperty(INFRAREDVOLUME, InfraredVolume);
	}


	public List findAll() {
		log.debug("finding all InfraredVolume instances");
		try {
			String queryString = "from InfraredVolume";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}

	public InfraredVolume merge(InfraredVolume detachedInstance) {
		log.debug("merging InfraredVolume instance");
		try {
			InfraredVolume result = (InfraredVolume) getSession().merge(
					detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public void attachDirty(InfraredVolume instance) {
		log.debug("attaching dirty InfraredVolume instance");
		try {
			getSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(InfraredVolume instance) {
		log.debug("attaching clean InfraredVolume instance");
		try {
			getSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}
}