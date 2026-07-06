-- AUTO-GENERATED: OP09-043 / 알비다
-- rules_id=OP09-043 script_id=880001139 fingerprint=36c424e1c2c509a2e626e1ba40f7ce840d824d0515f5dd93ea1691b4cec9a7e0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-043]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=5,
              name_neq=[[알비다]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[크로스 길드]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 리더가 《크로스 길드》 특징을 가진 경우, 자신의 패에서 「알비다」 이외의 코스트 5 이하인 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-043]],
    schema_version=1,
  })
end
