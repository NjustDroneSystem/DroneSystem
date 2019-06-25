package com.droneSystem.hibernate;

import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

/**
 * Role entity. @author MyEclipse Persistence Tools
 */

public class InfraredVolume implements java.io.Serializable {

	// Fields

	private Integer id;
	private Drone drone;
	private Integer infraredVolume;
	private Video video;
	private Timestamp time;

	// Constructors

	/** default constructor */
	public InfraredVolume() {
	}

	/** full constructor */
	public InfraredVolume(Drone drone, Integer infraredVolume, Video video, Timestamp time) {
		this.drone = drone;
		this.infraredVolume = infraredVolume;
		this.video = video;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	public Drone getDrone() {
		return this.drone;
	}

	public void setDrone(Drone drone) {
		this.drone = drone;
	}
	

	public Integer getInfraredVolume() {
		return infraredVolume;
	}

	public void setInfraredVolume(Integer infraredVolume) {
		this.infraredVolume = infraredVolume;
	}

	public Video getVideo() {
		return this.video;
	}

	public void setVideo(Video video) {
		this.video = video;
	}
	
	public Timestamp getTime() {
		return this.time;
	}
	
	public void setTime(Timestamp time) {
		this.time = time;
	}


}