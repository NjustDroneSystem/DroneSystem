package com.droneSystem.manager;



import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Transaction;

import com.droneSystem.hibernate.TrafficFlow;
import com.droneSystem.hibernate.TrafficFlowDAO;
import com.droneSystem.util.KeyValueWithOperator;


public class TrafficFlowManager {
	private TrafficFlowDAO m_dao = new TrafficFlowDAO();
	
	/**
	 * 根据TrafficFlow Id 查找 TrafficFlow对象
	 * @param id TrafficFlow Id
	 * @return TrafficFlow对象
	 */
	public TrafficFlow findById(int id) {
		return m_dao.findById(id);
	}

	/**
	 * 插入一条TrafficFlow记录
	 * @param trafficFlow TrafficFlow对象
	 * @return 插入成功，返回true；否则返回false
	 */
	public boolean save(TrafficFlow trafficFlow){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {	
			m_dao.save(trafficFlow);
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}
	
	/**
	 * 更新一条TrafficFlow记录
	 * @param trafficFlow TrafficFlow对象
	 * @return 更新成功，返回true；否则返回false
	 */
	public boolean update(TrafficFlow trafficFlow){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {			
			m_dao.update(trafficFlow);
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}
	
	/**
	 * 根据TrafficFlow Id,删除TrafficFlow对象
	 * @param id TrafficFlow id
	 * @return 删除成功，返回true；否则返回false
	 */
	public boolean deleteById(int id){
		Transaction tran = m_dao.getSession().beginTransaction();
		try {			
			TrafficFlow u = m_dao.findById(id);
			if(u == null){
				return true;
			}else{
				m_dao.delete(u);
			}			
			tran.commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return false;
		} finally {
			m_dao.closeSession();
		}
	}	
	
	/**
	 * 分页函数
	 * @param currentPage 当前页码
	 * @param pageSize 每页的记录数
	 * @param arr 条件键值对
	 * @return 分页后的User列表
	 */
	public List<TrafficFlow> findPagedAll(int currentPage, int pageSize, KeyValueWithOperator...arr) {
		try {
			return m_dao.findPagedAll("TrafficFlow", currentPage,pageSize, arr);
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 分页函数
	 * @param currentPage 当前页码
	 * @param pageSize 每页的记录数
	 * @return 分页后的Specification列表
	 */
	public List<TrafficFlow> findPagedAll(int currentPage, int pageSize, List<KeyValueWithOperator> arr) {
		try {
			return m_dao.findPagedAll("TrafficFlow", currentPage, pageSize, arr);
		} catch (Exception e) {
			return null;
		}
	}
	
	
	/**
	 * 得到所有TrafficFlow记录数
	 * @return TrafficFlow记录数
	 */
	public int getTotalCount(KeyValueWithOperator...arr){
		return m_dao.getTotalCount("TrafficFlow", arr);		
	}
	
	/**
	 * 得到所有TrafficFlow记录数
	 * @return TrafficFlow记录数
	 */
	public int getTotalCount(List<KeyValueWithOperator> arr){
		return m_dao.getTotalCount("TrafficFlow",arr);		
	}
	
	/**
	 * 多条件组合查询
	 * @param instance 条件的组合
	 * @return 符合条件的记录
	 */
	public List findByExample(TrafficFlow instance) {
		return m_dao.findByExample(instance);
	}

	
	/**
	 * 
	 * @param arr
	 * @return
	 */
	public List<TrafficFlow> findByVarProperty(KeyValueWithOperator...arr){
		try{
			return m_dao.findByVarProperty("TrafficFlow", arr);
		}
		catch(Exception e){
			return null;
		}
	}
	
	/**
	* 分页显示数据
	*@param queryString:查询语句（HQL）
	* @param currentPage
	* 当前页码, 从 1 开始
	* @param pageSize
	* 每页显示数据量
	* @param arr 查询语句中?对应的值
	* @return 分页后的数据列表- List
	*/
	public List findPageAllByHQL(String queryString, int currentPage, int pageSize, Object...arr){
		try{
			return m_dao.findPageAllByHQL(queryString, currentPage, pageSize, arr);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	* 分页显示数据
	*@param queryString:查询语句（HQL）
	* @param currentPage
	* 当前页码, 从 1 开始
	* @param pageSize
	* 每页显示数据量
	* @param arr 查询语句中?对应的值
	* @return 分页后的数据列表- List
	*/
	public List findPageAllByHQL(String queryString, int currentPage, int pageSize, List<Object> arr){
		try{
			return m_dao.findPageAllByHQL(queryString, currentPage, pageSize, arr);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	
	/**
	 * 得到记录总数
	 * @param queryString 查询语句（HQL）
	 * @param arr 查询语句中?对应的值
	 * @return
	 */
	public int getTotalCountByHQL(String queryString,Object...arr) {
		try{
			return m_dao.getTotalCountByHQL(queryString, arr);
		}catch(Exception ex){
			return 0;
		}
	}
	
	/**
	 * 得到记录总数
	 * @param queryString 查询语句（HQL）
	 * @param arr 查询语句中?对应的值
	 * @return
	 */
	public int getTotalCountByHQL(String queryString,List<Object> arr) {
		try{
			return m_dao.getTotalCountByHQL(queryString, arr);
		}catch(Exception ex){
			return 0;
		}
	}
	
	/**
	* 根据HQL更新
	* @param updateString HQL语句（update 表名 set 字段=值 where 条件）
	* @param arr 参数
	* @return 更新操作影响的记录数
	*/
	public int updateByHQL(String updateString, Object...arr) {		
		Transaction tran = m_dao.getSession().beginTransaction();
		try{
			int i = m_dao.updateByHQL(updateString, arr);
			tran.commit();
			return i;
		} catch (Exception e) {
			e.printStackTrace();
			tran.rollback();
			return 0;
		}finally {
			m_dao.closeSession();
		}
	}
}

