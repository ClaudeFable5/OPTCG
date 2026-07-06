-- AUTO-GENERATED: OP01-049 / 베포
-- rules_id=OP01-049 script_id=880000172 fingerprint=7e270b6c13dcc936b9f1bf3c0c4f57c032c7ceee4730d847ea422e2637a6cbad
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-049]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              name_neq=[[베포]],
              trait=[[하트 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패에서 「베포」 이외의 코스트 4 이하인 《하트 해적단》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-049]],
    schema_version=1,
  })
end
