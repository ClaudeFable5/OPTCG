-- AUTO-GENERATED: EB04-036 / 폭시
-- rules_id=EB04-036 script_id=880002457 fingerprint=aeede68b0a3cd858ed9c3ba2275ba6974a244a9536e01bfc3d87f917d93ef53f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB04-036]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                cost_lte=9,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[폭시 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】두웅!!-1: 자신의 리더가 《폭시 해적단》 특징을 가진 경우, 카드를 2장 뽑고, 자신의 패 1장을 버린다. 그 후, 상대의 코스트 9 이하인 캐릭터 1장까지를 레스트로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[RESTED]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】두웅!! 덱에서 두웅!! 1장까지를 레스트로 추가한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[EB04-036]],
    schema_version=1,
  })
end
