"use client"

import * as React from "react"
import { StarIcon } from "lucide-react"

import { Button } from "@/components/ui/button"

export type FavoriteRule = {
  id: string
  title: string
  rule: string
  image: string
  description: string
  section: string
  sectionHref: string
}

const storageKey = "la-liga-reglas-favoritas"
const updateEvent = "la-liga-favoritas-actualizadas"

export function favoriteId(sectionHref: string, title: string, rule: string) {
  return `${sectionHref}:${title}:${rule}`
}

export function getFavorites(): FavoriteRule[] {
  if (typeof window === "undefined") return []
  try {
    const saved = window.localStorage.getItem(storageKey)
    return saved ? (JSON.parse(saved) as FavoriteRule[]) : []
  } catch {
    return []
  }
}

function saveFavorites(favorites: FavoriteRule[]) {
  window.localStorage.setItem(storageKey, JSON.stringify(favorites))
  window.dispatchEvent(new Event(updateEvent))
}

export function FavoriteButton({ favorite }: { favorite: FavoriteRule }) {
  const [isFavorite, setIsFavorite] = React.useState(false)

  React.useEffect(() => {
    const sync = () => setIsFavorite(getFavorites().some((item) => item.id === favorite.id))
    sync()
    window.addEventListener(updateEvent, sync)
    return () => window.removeEventListener(updateEvent, sync)
  }, [favorite.id])

  function toggleFavorite() {
    const favorites = getFavorites()
    const exists = favorites.some((item) => item.id === favorite.id)
    saveFavorites(exists ? favorites.filter((item) => item.id !== favorite.id) : [favorite, ...favorites])
  }

  return (
    <Button type="button" variant={isFavorite ? "default" : "outline"} size="sm" onClick={toggleFavorite} className={isFavorite ? "bg-amber-500 text-amber-950 hover:bg-amber-400" : "border-amber-300 text-amber-700 hover:bg-amber-50 hover:text-amber-800"}>
      <StarIcon className={`size-4 ${isFavorite ? "fill-current" : ""}`} />
      {isFavorite ? "En favoritas" : "Guardar en favoritas"}
    </Button>
  )
}

export { updateEvent }
