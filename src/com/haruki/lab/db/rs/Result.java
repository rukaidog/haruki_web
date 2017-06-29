package com.haruki.lab.db.rs;

import java.util.SortedMap;

public interface Result {

    /**
     * <p>Returns the result of the query as an array of <code>SortedMap</code> objects. 
     * Each item of the array represents a specific row in the query result.</p>
     *
     * <p>A row is structured as a <code>SortedMap</code> object where the key is the column name, 
     * and where the value is the value associated with the column identified by 
     * the key. The column value is an Object of the Java type corresponding 
     * to the mapping between column types and Java types defined by the JDBC 
     * specification when the <code>ResultSet.getObject()</code> method is used.</p>
     *
     * <p>The <code>SortedMap</code> must use the <code>Comparator</code> 
     * <code>java.util.String.CASE_INSENSITIVE_ORDER</code>. 
     * This makes it possible to access the key as a case insensitive representation 
     * of a column name. This method will therefore work regardless of the case of 
     * the column name returned by the database.</p>
     *
     * @return The result rows as an array of <code>SortedMap</code> objects
     */
    public SortedMap[] getRows();

    /**
     * Returns the result of the query as an array of arrays. 
     * The first array dimension represents a specific row in the query result. 
     * The array elements for each row are Object instances of the Java type 
     * corresponding to the mapping between column types and Java types defined 
     * by the JDBC specification when the <code>ResultSet.getObject()</code> method is used.
     *
     * @return the result rows as an array of <code>Object[]</code> objects
     */
    public Object[][] getRowsByIndex();

    /**
     * Returns the names of the columns in the result. The order of the names in the array 
     * matches the order in which columns are returned in method getRowsByIndex().
     *
     * @return the column names as an array of <code>String</code> objects
     */
    public String[] getColumnNames();

    /**
     * Returns the number of rows in the cached ResultSet
     *
     * @return the number of rows in the result
     */
    public int getRowCount();

    /**
     * Returns true if the query was limited by a maximum row setting
     *
     * @return <tt>true</tt> if the query was limited by a maximum
     * row setting
     */
    public boolean isLimitedByMaxRows();
}
