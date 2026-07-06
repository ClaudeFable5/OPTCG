-- AUTO-GENERATED: OP11-067 / 샬롯 카타쿠리
-- rules_id=OP11-067 script_id=880001401 fingerprint=a8134e8c6fc0969180e410a5e440e91d69e25ba723f337c6cbc4121ffe4a3d1c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-067]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=2,
              filter={
                cost_gte=3,
                trait=[[빅 맘 해적단]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            player=[[YOU]],
            state=[[RESTED]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 코스트 3 이상인 《빅 맘 해적단》 특징을 가진 캐릭터를 2장까지 액티브로 한다. 그 후, 자신의 두웅!! 덱에서 두웅!!을 1장까지 레스트 상태로 추가한다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP11-067]],
    schema_version=1,
  })
end
