"use client"

import Image from "next/image"
import * as React from "react"
import { ExternalLinkIcon, HeartIcon } from "lucide-react"

import { FavoriteButton, favoriteId, getFavorites, type FavoriteRule, updateEvent } from "@/components/favorite-button"

export function FavoritesSection() {
  const [favorites, setFavorites] = React.useState<FavoriteRule[]>([])

  React.useEffect(() => {
    const sync = () => setFavorites(getFavorites())
    sync()
    window.addEventListener(updateEvent, sync)
    return () => window.removeEventListener(updateEvent, sync)
  }, [])

  return (
    <section className="rounded-2xl border bg-card p-5 shadow-sm md:p-7">
      <div className="flex flex-col gap-2">
        <p className="text-sm font-medium tracking-[0.18em] text-emerald-700 uppercase">Acceso rápido</p>
        <h2 className="text-2xl font-semibold tracking-tight">Tus favoritas</h2>
        <p className="max-w-2xl text-sm leading-6 text-muted-foreground">Estas situaciones se guardan solamente en este dispositivo.</p>
      </div>
      {favorites.length === 0 ? (
        <div className="mt-6 rounded-xl border border-dashed p-8 text-center text-sm text-muted-foreground"><HeartIcon className="mx-auto mb-3 size-6 text-rose-500" />Aún no tienes situaciones favoritas. Abre una situación y toca el corazón para guardarla aquí.</div>
      ) : (
        <div className="mt-6 grid gap-4 md:grid-cols-2">
          {favorites.map((favorite) => (
            <article key={favorite.id} className="overflow-hidden rounded-xl border bg-background">
              <div className="relative h-44 border-b bg-white"><Image src={favorite.image} alt={`Ilustración: ${favorite.title}`} fill sizes="(min-width: 768px) 40vw, 100vw" className="object-contain" /></div>
              <div className="p-4">
                <p className="text-xs font-medium tracking-wide text-emerald-700 uppercase">{favorite.section}</p>
                <h3 className="mt-1 font-semibold">{favorite.title}</h3>
                <p className="mt-1 text-sm text-muted-foreground">{favorite.rule}</p>
                <p className="mt-3 text-sm leading-6">{favorite.description}</p>
                <div className="mt-4 flex flex-wrap items-center gap-3">
                  <a href={favorite.sectionHref} className="inline-flex items-center gap-1 text-sm font-semibold text-emerald-800 hover:text-emerald-600">Ver sección <ExternalLinkIcon className="size-4" /></a>
                  <FavoriteButton favorite={{ ...favorite, id: favoriteId(favorite.sectionHref, favorite.title, favorite.rule) }} />
                </div>
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  )
}
