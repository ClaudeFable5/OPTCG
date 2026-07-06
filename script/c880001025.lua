-- AUTO-GENERATED: OP08-049 / 스피드 질
-- rules_id=OP08-049 script_id=880001025 fingerprint=8da600d44aefc435b336e264666bad3f39781f13c4bd4544392d5f2266c9feaa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              trait_contains=[[흰 수염 해적단]],
            },
            on_match={
              {
                duration=[[THIS_TURN]],
                keyword=[[RUSH]],
                op=[[GAIN_KEYWORD]],
                selector={
                  count=1,
                  kind=[[SELF]],
                  mode=[[UP_TO]],
                  owner=[[YOU]],
                },
              },
            },
            op=[[REVEAL_DECK_TOP]],
            player=[[YOU]],
            reposition_before_match=true,
            rest_destinations={
              [[DECK_TOP]],
              [[DECK_BOTTOM]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 덱 위에서 1장을 공개하고, 그 카드를 덱 맨 위나 아래로 되돌린다. 공개한 카드가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 턴 동안, 이 캐릭터는 【속공】을 얻는다.
(이 카드는 등장한 턴에 어택할 수 있다)]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-049]],
    schema_version=1,
  })
end
