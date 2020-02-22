;;; nkea.el --- nkea -*- lexical-binding: t; -*-

;; Copyright (c) 2020 Abhinav Tushar

;; Author: Abhinav Tushar <abhinav@lepisma.xyz>
;; Version: 0.0.1
;; Package-Requires: ((emacs "26"))
;; URL: https://github.com/Vernacular-ai/nkea.el

;;; Commentary:

;; nkea
;; This file is not a part of GNU Emacs.

;;; License:

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(require 'mu4e)
(require 'org)
(require 'eieio)
(require 'cl-lib)

(defgroup nkea nil
  "Customization group for nkea."
  :group 'convenience)

(defcustom nkea-org-file nil
  "Org file to keep scheduling information for nkea items in."
  :group 'nkea)

(defclass nkea-item ()
  ()
  "Base nkea item."
  :abstract t)

(defclass nkea-mu4e-item (nkea-item)
  ()
  "nkea item connected to an email via mu4e.")

;;; Actions that can be taken

(cl-defmethod nkea-snooze ((it nkea-item))
  "Snooze the item.")

(cl-defmethod nkea-share ((it nkea-item))
  "Generic sharing action for item.")

(cl-defmethod nkea-act ((it nkea-item))
  "Default action for item.")

(cl-defmethod nkea-delete ((it nkea-item))
  "Delete action.")

(cl-defmethod nkea-archive ((it nkea-item))
  "Archive action.")

;;; Item farming
;; TODO: collect items, use priority

(defun nkea-items-from-org ()
  "Collect todo items from nkea org file. The items are backed by
mu4e mail links."
  ())

(defun nkea-items-from-mu4e (mu-query)
  "Return items from mu4e using given mu-query."
  ())

;;; Session
;; TODO: timings, navigation

(defclass nkea-session ()
  ((time-limit :initarg :time-limit)
   (items :initarg items)
   (timer)))

(cl-defmethod nkea-display ((it nkea-item))
  "Display given item in buffer")

(defun nkea-next ())

(defun nkea-prev ())

(defun nkea-begin ()
  (interactive))

(defun nkea-quit ())

(provide 'nkea)

;;; nkea.el ends here
