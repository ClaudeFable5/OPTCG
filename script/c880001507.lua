-- AUTO-GENERATED: OP12-054 / 마샬 D. 티치
-- rules_id=OP12-054 script_id=880001507 fingerprint=affb40d8ab6c02e9a796c0fe008d128e7906ef4b17d224e5a142e665db980ae3
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-054]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[RETURN_TO_HAND]],
            selector={
              count=1,
              filter={
                cost_lte=1,
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[ANY]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[왕의 부하 칠무해]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《왕의 부하 칠무해》 특징을 가진 경우, 이 캐릭터 이외의 코스트 1 이하인 캐릭터를 1장까지 주인의 패로 되돌린다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP12-054]],
    schema_version=1,
  })
end
