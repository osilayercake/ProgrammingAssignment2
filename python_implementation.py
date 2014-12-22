# -*- coding: utf-8 -*-
"""
Not silly cachematrix 

Python 2.7
"""

import numpy as np

class CacheMatrix(np.matrixlib.defmatrix.matrix):
    '''
    A Python class that implements matrix inverse caching.
    
    In this instance CacheMatrix is a subclass of Numpy's Matrix object
    and so does everything it does in addition to the desired functionality
    '''
    def __init__(self, *args, **kwargs):
        np.matrixlib.defmatrix.matrix.__init__(self, *args, **kwargs)
        self._cached_inverse = None
    
    @property
    def inverse(self):
        '''
        Takes the inverse of the matrix, returnins the cached value if it exists.
        '''
        if self._cached_inverse is None:
            self._cached_inverse = np.linalg.inv(self)
            
        return self._cached_inverse
        
    def clear_inverse_cache(self):
        '''
        Clears the cache
        '''
        self._cached_inverse = None
        
        return self
        
if __name__ == '__main__':
    
    # Example usage
    foo = CacheMatrix([[1,2],[3,4]])
    
    # Get the inverse
    print foo.inverse
    
    #But you can still do all the other fun matrix stuff like:
    foo.transpose()
    